{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./main-user.nix
      ./font.nix
      ./programme.nix
      ./login.nix
      ./sounds.nix
      ./bluetooth.nix
    ];

  nixpkgs.config.allowUnfree = true;

  programs.wshowkeys.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  login.gdm.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  sounds.enable = true;

  bluetooth.enable = true;

  font.enable = true;

  powerManagement.powertop.enable = true;

  services.tlp.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.opengl.enable = true;

  main-user.enable = true;
  main-user.userName = "yusuf";

  programme.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "Yusuf-NixOS";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  programs.fish.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de-latin1";
    useXkbConfig = false;
  };

  system.stateVersion = "23.11";

}

