- Enable networking in live ISO: https://nixos.org/manual/nixos/stable/#sec-installation-manual-networking
- Run from live ISO:
  ```bash
  nix-shell -p git
  sudo bash -c "$(curl https://raw.githubusercontent.com/stellarhoof/nixos-hosts/master/bin/install.sh)" -- --host string --disk string
  ```
- Run from installed system: `sudo /etc/nixos/bin/after-boot.sh`
