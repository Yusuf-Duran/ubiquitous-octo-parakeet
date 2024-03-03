{lib, fetchFromGitHub, config, pkgs, ...}:
{
  options = {
    kitty.enable
      = lib.mkEnableOption "enable kitty module";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty.enable = true;
    programs.kitty.theme = "Catppuccin-Mocha";
  };
}