[Enable networking in live ISO](https://nixos.org/manual/nixos/stable/#sec-installation-manual-networking) and run

```bash
nix-shell -p git
sudo bash -c "$(curl https://raw.githubusercontent.com/stellarhoof/nixos-hosts/master/bin/install.sh)" -- --host string --disk string
```
