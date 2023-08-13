### Enable networking in the installer

Follow https://nixos.org/manual/nixos/stable/#sec-installation-manual-networking

### Install NixOS

```sh
sudo bash -c "$(curl https://raw.githubusercontent.com/stellarhoof/nixos-hosts/master/bin/install.sh)" --host string --disk string
```

### After booting into new system

```sh
sudo /etc/nixos/bin/after-boot.sh --realname string --username string
```
