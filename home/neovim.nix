{ pkgs, lib, config, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };

    plugins = {
      lualine = {
        enable = true;
      };
      telescope = {
        enable = true;
      };
      rainbow-delimiters = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
      autoclose = {
        enable = true;
      };
      barbecue = {
        enable = true;
      };
      neo-tree = {
        enable = true;
      };
      staline = {
        enable = true;
      };
      nvim-autopairs = {
        enable = true;
      };
      auto-session = {
        enable = true;
      };
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true; # nix
          bashls.enable = true; # bash
          clangd.enable = true; # c, c++
          eslint.enable = true; # javascript
          hls.enable = true; # haskell
          jsonls.enable = true; # json
          prolog-ls.enable = true; # prolog
          pylsp.enable = true; # python
          texlab.enable = true; # latex
          tsserver.enable = true; # typescript
          volar.enable = true; # vue
        };
      };
      notify = {
        enable = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      lazygit-nvim
    ];

    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
  };
}
