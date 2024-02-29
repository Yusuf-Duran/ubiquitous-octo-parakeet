



{lib, config, pkgs, ...}:
{
  options = {
    programme.enable
      = lib.mkEnableOption "enable programme module"; 
  };

  config = lib.mkIf config.programme.enable {
    environment.systemPackages = with pkgs; [
      vim
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
