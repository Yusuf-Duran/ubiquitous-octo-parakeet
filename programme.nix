{lib, config, pkgs, ...}:
{
  options = {
    programme.enable
      = lib.mkEnableOption "enable programme module"; 
  };

  config = lib.mkIf config.programme.enable {
    environment.systemPackages = with pkgs; [
      vim
      vscode
      lazygit
      dconf
      firefox
      catppuccin-gtk
      wget
      curl
      git
      discord
      neovim
      kitty
      fish
      spotify
    ];
  };

}
