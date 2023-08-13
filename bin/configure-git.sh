#! /usr/bin/env nix-shell
#! nix-shell -i bash -p gnupg sshpass

# TODO: Change shebang once https://github.com/NixOS/nix/pull/5189 lands

# Exit the script if any statement returns a non-true return value.
set -o errexit

function usage {
  echo "usage: $0 --pass string"
  echo ""
  echo "  --pass string   passphrase of the gpg master private key"
}

function die {
  echo "Script failed: $1"
  echo ""
  usage
  exit 1
}

# https://keestalkstech.com/2022/03/named-arguments-in-a-bash-script/
while [ $# -gt 0 ]; do
  if [[ $1 == "--"* ]]; then
    v="${1/--/}"
    declare "$v"="$2"
    shift
  fi
  shift
done

if [[ -z "$pass" ]]; then
  die "Missing parameter --pass"
fi

raw_url="https://raw.githubusercontent.com/stellarhoof/pass/master"

mkdir -p ~/.ssh

printf "\nImporting private gpg key...........\n\n"
curl "$raw_url/gpg/store" | gpg --import --passphrase "$pass" --pinentry-mode loopback -

printf "\nDownloading and decrypting github private ssh key...........\n\n"
curl "$raw_url/ssh/github.com.gpg" | gpg -d --passphrase "$pass" --pinentry-mode loopback > ~/.ssh/github.com

printf "\nGithub private SSH key passphrase:\n\n"
curl "$raw_url/ssh/github.com.passphrase.gpg" | gpg -d --passphrase "$pass" --pinentry-mode loopback

printf "\nAdding Github private SSH key...........\n\n"
chmod 600 ~/.ssh/github.com
ssh-add ~/.ssh/github.com

printf "\nConfiguring git...........\n\n"
git remote set-url origin git@github.com:stellarhoof/nixos-hosts.git
git config user.email azure.satellite@gmail.com
git config user.name "Alejandro Hernandez"
