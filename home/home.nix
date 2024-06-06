{ inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "yusuf" = import ./yusuf.nix;
    };
    backupFileExtension = "backup";
  };
}
