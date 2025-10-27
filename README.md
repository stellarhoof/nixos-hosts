# Installing on a framework laptop

```bash
# Run a shell with git available
nix-shell -p git

git clone https://github.com/stellarhoof/nixos-hosts && cd nixos-hosts
git remote set-url origin git@github.com:stellarhoof/nixos-hosts.git

# Generate hardware configuration
nixos-generate-config --show-hardware-config > ./hosts/framework/system/hardware-configuration.nix

# Test the system configuration
nixos-rebuild --flake . build-vm

# Build the system configuration and add a boot entry
nixos-rebuild --flake . boot

# Build the user's configuration and switch to it
home-manager -b backup switch

# Clone the neovim configuration
git clone https://github.com/stellarhoof/nvim ~/.config/nvim
git remote set-url origin git@github.com:stellarhoof/nvim.git
```

# After the installation

```bash
git clone https://github.com/stellarhoof/pass && cd pass
git remote set-url origin git@github.com:stellarhoof/pass.git

# Link the password store to the location `pass` expects.
ln -sf $PWD $PASSWORD_STORE_DIR

# Import private gpg key.
gpg --import store-key.asc

# Setup SSH authentication with github
mkdir -p ~/.ssh
pass ssh/github.com > ~/.ssh/github.com
chmod 600 ~/.ssh/github.com
ssh-add ~/.ssh/github.com
```
