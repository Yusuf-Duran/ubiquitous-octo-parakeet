{ pkgs, config, inputs, ... }:
let
  system = "x86_64-linux";
in
{
  home.packages = [
    (inputs.nixvim.legacyPackages."${system}".makeNixvimWithModule {
      inherit pkgs;
      module = ./config;
    })
  ];

}
