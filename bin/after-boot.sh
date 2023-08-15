#!/usr/bin/env bash

# Exit the script if any statement fails.
set -o errexit

# Change ownership of this repository to current username.
chown -R "$(whoami):wheel" /etc/nixos

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
git config user.name "$(getent passwd | grep "$(whoami)" | cut -d: -f5)"
git config user.email "$(gpg -K --with-colons | grep '^uid' | cut -d'<' -f2 | cut -d'>' -f1)"
