{ config, pkgs, ... }:
{
  imports = [
    ./hypr
    ./gtk.nix
    ./spotify.nix
  ];

  hypr.enable = true;

  home.username = "yusuf";
  home.homeDirectory = "/home/yusuf";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}

