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

  login.gdm.enable = true;

  programs.hyprland.enable = true;

  sounds.enable = true;

  bluetooth.enable = true;

  font.enable = true;

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

