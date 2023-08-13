#!/usr/bin/env bash

# Exit the script if any statement fails.
set -o errexit

function usage {
  echo "usage: $0 --realname string --username string --email string"
  echo ""
  echo "  --realname string   full name of admin user"
  echo "  --username string   username of admin user"
  echo "  --email    string   email of admin user"
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

if [[ -z "$realname" ]]; then
  die "Missing parameter --realname"
elif [[ -z "$username" ]]; then
  die "Missing parameter --username"
elif [[ -z "$email" ]]; then
  die "Missing parameter --email"
fi

# Add user.
useradd -c "$realname" -m $username
passwd $username

# Make user an admin.
usermod -aG wheel $username

# Allow user to control NetworkManager.
usermod -aG networkmanager $username

# Change ownership of this repository to just created username.
chown -R $username:wheel /etc/nixos

# Import private gpg key.
curl https://raw.githubusercontent.com/stellarhoof/pass/master/gpg/store | gpg --import -

# Download and decrypt private github ssh key.
mkdir -p ~/.ssh
curl https://raw.githubusercontent.com/stellarhoof/pass/master/ssh/github.com.gpg | gpg -d > ~/.ssh/github.com

# Cache private github ssh key.
chmod 600 ~/.ssh/github.com
ssh-add ~/.ssh/github.com

# Configure git.
git remote set-url origin git@github.com:stellarhoof/nixos-hosts.git
git config user.email $email
git config user.name "$realname"
