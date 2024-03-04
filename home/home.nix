{ inputs, ... }:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "yusuf" = import ./yusuf.nix;
    };
  };
}
