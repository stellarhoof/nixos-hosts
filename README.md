- Enable networking in live ISO: https://nixos.org/manual/nixos/stable/#sec-installation-manual-networking
- Run from live ISO: `sudo bash -c "$(curl https://raw.githubusercontent.com/stellarhoof/nixos-hosts/master/bin/install.sh)" --host string --disk string`
- Run from installed system: `sudo /etc/nixos/bin/after-boot.sh`

TODO:

- Console login managers
  - https://github.com/coastalwhite/lemurs
  - https://github.com/tvrzna/emptty
  - https://github.com/fairyglade/ly
- Backlight
  Requirements:
  - Restores backlight after boot
  - Should be able to control external monitor
  - https://github.com/Hummer12007/brightnessctl
    - Registers udev rule
    - User must be in the `video` group
    - Can control external monitor via `ddci-driver-linux` (`ddcci`)
  - https://gitlab.com/cameronnemo/brillo
    - Registers udev rule
    - User must be in the `video` group
    - Can control external monitor via `ddci-driver-linux` (`ddcci`)
  - https://github.com/haikarainen/light (unmaintained)
    - Listens for keystrokes
    - User must be in the `video` group
