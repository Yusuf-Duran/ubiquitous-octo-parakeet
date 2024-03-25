{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    lazygit-nvim
  ];
}
