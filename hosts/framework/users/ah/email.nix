{ pkgs, config, ... }:

{
  accounts.email.accounts.personal = {
    enable = true;
    primary = true;
    address = "azure.satellite@gmail.com";
    flavor = "gmail.com";
    realName = "Alejandro Hernandez";
    thunderbird.enable = config.programs.thunderbird.enable;
  };

  accounts.email.accounts.sidekick = {
    enable = true;
    address = "panoramic.giggle@gmail.com";
    flavor = "gmail.com";
    realName = "Alejandro Hernandez";
    thunderbird.enable = config.programs.thunderbird.enable;
  };

  accounts.email.accounts.govspend = {
    enable = true;
    address = "ahernandez@govspend.com";
    flavor = "gmail.com";
    realName = "Alejandro Hernandez";
    thunderbird.enable = config.programs.thunderbird.enable;
  };

  # Mail client
  programs.thunderbird.enable = true;
  programs.thunderbird.profiles.default = {
    isDefault = true;
  };
}
