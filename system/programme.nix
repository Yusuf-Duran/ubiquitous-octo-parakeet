{ lib, config, pkgs, ... }:
{
  options = {
    programme.enable = lib.mkEnableOption "enable programme module";
  };

  config = lib.mkIf config.programme.enable {
    environment.systemPackages = with pkgs; [
      anki-bin
      ghc
      llvmPackages_18.clang-unwrapped
      lazygit
      libnotify
      nixpkgs-fmt
      dconf
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
