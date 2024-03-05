{ pkgs, lib, config, ... }:

{
  options = {
    catppuccin.enable = lib.mkEnableOption "enable catppuccin module";
  };

  config = lib.mkIf config.catppuccin.enable {
    home.packages = with pkgs; [
      catppuccin
    ];
  };
}
