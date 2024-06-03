{ pkgs, config, lib, inputs, ... }:
let
  vscode-extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace;
in
{
  options = {
    vscode.enable = lib.mkEnableOption "enable vscode module";
  };

  config = lib.mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      extensions = with vscode-extensions;[
        yzhang.markdown-all-in-one
        llvm-vs-code-extensions.vscode-clangd
        bbenoist.nix
        dbaeumer.vscode-eslint
        eamodio.gitlens
        github.copilot
        github.copilot-chat
        equinusocio.vsc-material-theme-icons
        ms-python.python
        ms-python.vscode-pylance
        ms-vscode-remote.remote-ssh
        jeff-hykin.better-cpp-syntax
        psycha0s.cpp-format
        expresssnippets.vscode-express-snippets
        waderyan.gitblame
        zerocinc.slice
        vitest.explorer
        kingwl.vscode-vitest-runner
        deinsoftware.vitest-snippets
        vue.volar
      ];
    };
  };
}
