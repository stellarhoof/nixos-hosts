## Install system

```sh
# Enable networking in the installer: https://nixos.org/manual/nixos/stable/#sec-installation-manual-networking

sudo systemctl start wpa_supplicant
wpa_cli
# Execute this in the wpa_cli shell
# > add_network
# > set_network 0 ssid "myhomenetwork"
# > set_network 0 psk "mypassword"
# > set_network 0 key_mgmt WPA-PSK
# > enable_network 0

# Install NixOS
curl https://raw.githubusercontent.com/stellarhoof/nixos-hosts/master/bin/install.sh > install.sh
chmod +x install.sh
sudo ./install.sh --host <hostname> --disk <device>
```

## Push changes upstream

```sh
./bin/push.sh
```
