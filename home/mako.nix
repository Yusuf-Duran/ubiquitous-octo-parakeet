{lib, fetchFromGitHub, config, pkgs, ...}:
{
  options = {
    mako.enable
      = lib.mkEnableOption "enable mako module";
  };

  config = lib.mkIf config.mako.enable {
    services.mako.enable = true;
    services.mako.backgroundColor = "#1e1e2e";
    services.mako.textColor = "#cdd6f4";
    services.mako.borderColor = "#89b4fa";
    services.mako.progressColor = "#313244";
    services.mako.defaultTimeout = 3500;
  };
}