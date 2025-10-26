What's the difference between `nix-env` and `nix profile`?

# Installing on a framework laptop

```bash
# Run a shell with git available
nix-shell -p git

git clone https://github.com/stellarhoof/nixos-hosts && cd nixos-hosts

# Generate hardware configuration
nixos-generate-config --show-hardware-config > ./hosts/framework/system/hardware-configuration.nix

# Test the system configuration
nixos-rebuild --flake . build-vm

# Build the system configuration and add a boot entry
nixos-rebuild --flake . boot

# Build the user's configuration and switch to it
home-manager -b backup switch
```

# After the installation

```bash
git clone https://github.com/stellarhoof/pass && cd pass
ln -sf $PWD $PASSWORD_STORE_DIR

# Import private gpg key.
gpg --import store-key.asc

# Download and decrypt private github ssh key.
mkdir -p ~/.ssh
pass ssh/github.com > ~/.ssh/github.com
chmod 600 ~/.ssh/github.com
ssh-add ~/.ssh/github.com

# Set repository ownership and remote origin
git remote set-url origin git@github.com:stellarhoof/nixos-hosts.git

# Clone necessary repositories
[ ! -d ~/.config/nvim ] && git clone git@github.com:stellarhoof/nvim.git ~/.config/nvim
[ ! -d ~/.config/home-manager ] && git clone -q git@github.com:stellarhoof/nix-home.git ~/.config/home-manager
[ ! -d ~/.local/share/password-store ] && git clone git@github.com:stellarhoof/pass.git ~/.local/share/password-store
```
