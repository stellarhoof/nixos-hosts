#!/usr/bin/env bash

# Exit the script if any statement fails.
set -o errexit

function usage {
  echo "usage: $0 --host string --disk string"
  echo ""
  echo "  --host string   hostname of this machine (ex: framework)"
  echo "  --disk string   name of disk device  (ex: /dev/nvme0n1)"
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

if [[ -z "$host" ]]; then
  die "Missing parameter --host"
elif [[ -z "$disk" ]]; then
  die "Missing parameter --disk"
fi

# Adapted from https://nixos.org/manual/nixos/stable/#sec-installation-manual

# Setup partitions
parted "$disk" -- mklabel gpt # Create GPT partition table
parted "$disk" -- mkpart primary 512MB -8GB # Add the root partition
parted "$disk" -- mkpart primary linux-swap -8GB 100% # Add a swap partition
parted "$disk" -- mkpart ESP fat32 1MB 512MB # Add the boot partition
parted "$disk" -- set 3 esp on # The manual said so

# Format partitions
mkfs.ext4 -L nixos "${disk}p1" # Create root partition
mkswap -L swap "${disk}p2" # Create swap partition
mkfs.fat -n boot -F 32 "${disk}p3" # Create boot partition

# Mount partitions
mount /dev/disk/by-label/nixos /mnt # Mount root partition
mkdir -p /mnt/boot && mount /dev/disk/by-label/boot /mnt/boot # Mount boot partition
swapon /dev/disk/by-label/swap # Activate swap in case the NixOS installation uses lots of memory

# Clone custom host configuration
git clone https://github.com/stellarhoof/nixos-hosts.git /mnt/etc/nixos

# Set repository ownership and remote origin
cd /mnt/etc/nixos && chown -R ah:wheel . && git remote set-url origin git@github.com:stellarhoof/nixos-hosts.git

# Allow any user to perform operations on any repository
git config --file /mnt/etc/gitconfig --add safe.directory '*'

# Generate host hardware configuration
nixos-generate-config --root /mnt --dir "/mnt/etc/nixos/hosts/$host"

# Install system
nixos-install --flake "/mnt/etc/nixos#$host"
