{ lib, config, pkgs, ... }:
{
  options = {
    avizo.enable = lib.mkEnableOption "enable avizo module";
  };

  config = lib.mkIf config.avizo.enable {
    services.avizo.enable = true;
    services.avizo.settings = {
      default = {
        time = 1.0;
        background = "rgb (30, 30, 46)";
        bar-fg-color = "rgb(147, 153, 178)";
        bar-bg-color = "rgb(88, 91, 112)";
        border-color = "rgb (137, 180, 250)";
      };
    };
  };
}

