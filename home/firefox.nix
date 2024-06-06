{ config, pkgs, lib, ... }:
let x = 2; #firefox-addons = config.nur.repos.rycee.firefox-addons;
in
{
  options = {
    firefox.enable = lib.mkEnableOption "enable firefox module";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles = {
        yusuf = {
          bookmarks = [{
            name = "wikipedia";
            tags = [ "wiki" ];
            keyword = "wiki";
            url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&amp;go=Go";
          }];
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            privacy-badger
            ublock-origin
            bitwarden
          ];
          settings = {
            "extensions.autoDisableScopes" = 0;
          };
        };
      };
    };
  };
}
