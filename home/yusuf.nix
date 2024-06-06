{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hypr
    ./gtk.nix
    ./spotify.nix
    ./nixvim
    ./vscode.nix
    ./firefox.nix
  ];

  hypr.enable = true;
  vscode.enable = true;
  firefox.enable = true;

  home.username = "yusuf";
  home.homeDirectory = "/home/yusuf";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}

