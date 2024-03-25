{
  plugins = {
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
  };
}
