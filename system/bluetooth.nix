{ lib, config, pkgs, ... }:
{
  options = {
    bluetooth.enable = lib.mkEnableOption "enable bluetooth module";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;
  };
}
