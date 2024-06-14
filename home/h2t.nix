{pkgs, inputs, ...}:
{
  imports = [
    ./nixvim
  ];
  home = {
    username = "uzivy_duran";
    homeDirectory = "/common/homes/students/uzivy_duran";
    packages = with pkgs; [
      home-manager
    ];
    stateVersion = "23.11";

    #activation = {
    #  linkDesktopAppliations = {
    #      after = ["writeBoundary" "createXdgUserDirectories"];
    #      before = [];
    #    };
    #};
      
  };
  #xdg = {
  #  enable = true;
  #  systemDirs.data = "/common/homes/students/uzivy_duran/.local/state/nix/profiles/profile";
  #}
  nix = {
    package = pkgs.nixFlakes;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
    };
    nixpkgs.config.allowUnfree = true;
}
