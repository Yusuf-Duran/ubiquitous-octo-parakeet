{ lib, config, pkgs, ... }:
{
  imports = [
    ./rofi.nix
    ./kitty.nix
    ./mako.nix
    ./avizo.nix
  ];

  options = {
    hypr.enable = lib.mkEnableOption "enable hypr module";
  };

  config = lib.mkIf config.hypr.enable {
    home.packages = with pkgs; [
      grimblast
      waybar
    ];

    avizo.enable = true;
    rofi.enable = true;
    kitty.enable = true;
    mako.enable = true;

    wayland.windowManager.hyprland.enable = true;

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "waybar"
        "avizo-service"
      ];

      monitor = [ "eDP-1, preferred, auto, auto" ];

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        force_default_wallpaper = 0;
      };

      binds = {
        workspace_back_and_forth = true;
      };

      input = {
        kb_layout = "de";
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
        };
      };

      "$mod" = "SUPER";

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, volumectl -u up"
        ", XF86AudioLowerVolume, exec, volumectl -u down"
      ];

      bind = [
        "$mod, Q, exec, kitty"
        "$mod, R, exec, rofi -show drun"
        "$mod, C, killactive"
        "$mod SHIFT, S, exec, grimblast --freeze --notify copy area"
      ]
      ++ (
        builtins.concatLists (builtins.genList
          (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
    };
  };
} 
