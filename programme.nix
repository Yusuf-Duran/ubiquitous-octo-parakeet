{lib, config, pkgs, ...}:
{
  options = {
    programme.enable
      = lib.mkEnableOption "enable programme module"; 
  };

  config = lib.mkIf config.programme.enable {
    environment.systemPackages = with pkgs; [
      vim
      lazygit
      dconf
      firefox
      catppuccin-gtk
      mako
      grimblast
      wget
      curl
      git
      discord
      neovim
      waybar
      rofi-wayland
      kitty
      fish
      spotify
    ];
  };

}
