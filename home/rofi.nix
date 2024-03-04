{lib, fetchFromGitHub, config, pkgs, ...}:
{
  imports = [
    ./catppuccin.nix
  ];

  options = {
    rofi.enable
      = lib.mkEnableOption "enable rofi module";
  };

  config = lib.mkIf config.rofi.enable {
    catppuccin.enable = true;
    programs.rofi.enable = true;
    programs.rofi.package = pkgs.rofi-wayland;
    programs.rofi.theme = "${pkgs.catppuccin}/rofi/catppuccin-macchiato.rasi";
    programs.rofi.extraConfig = {
      modi = "run,drun,window";
      icon-theme = "Oranchelo";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      display-Network = " 󰤨  Network";
      sidebar-mode = true;
    };
  };
}