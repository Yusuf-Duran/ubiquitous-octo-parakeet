{ lib, config, pkgs, ... }:
{
  options = {
    programme.enable = lib.mkEnableOption "enable programme module";
  };

  config = lib.mkIf config.programme.enable {
    environment.systemPackages = with pkgs; [
      vscode
      anki-bin
      ghc
      lazygit
      libnotify
      nixpkgs-fmt
      dconf
      firefox
      swiProlog
      wget
      curl
      git
      discord
      kitty
      fish
      btop
      logseq
      openvpn
      gnome.nautilus
    ];
  };
}
