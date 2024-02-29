{ config, lib, ... }:
let
  cfg = config.login.gdm;
in
{
  options = {
    login.gdm.enable = lib.mkEnableOption "enable gdm module";
  };
  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };
  };
}