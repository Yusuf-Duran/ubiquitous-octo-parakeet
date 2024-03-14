{ lib, config, pkgs, inputs, ... }:
let
  hyprplugins = inputs.hyprland-plugins.packages.${pkgs.system};
in
{
  imports = [
    ../rofi.nix
    ../kitty.nix
    ../mako.nix
    ../avizo.nix
    ../waybar.nix
    ../wlogout
  ];

  options = {
    hypr.enable = lib.mkEnableOption "enable hypr module";
  };

  config = lib.mkIf config.hypr.enable {
    home.packages = with pkgs; [
      grimblast
      hyprlock
      hyprpaper
    ];

    avizo.enable = true;
    waybar.enable = true;
    rofi.enable = true;
    kitty.enable = true;
    mako.enable = true;
    wlogout.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      plugins = with hyprplugins; [
      ];
    };

    xdg.configFile = {
      "hypr/hyprlock.conf".source = ./hyprlock.conf;

      "hypr/hyprpaper.conf".source = ./hyprpaper.conf;
      "hypr/wallpaper.png".source = ./wallpaper.png;
    };

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "waybar"
        "avizo-service"
        "hyprpaper"
        "[ workspace special silent ] discord"
        "[ workspace special silent ] spotify"
      ];

      windowrulev2 = [
        "workspace special, silent, class:^(discord)$"
      ];

      general = {
        layout = "dwindle";
      };

      dwindle = {
        preserve_split = true;
      };

      monitor = [ "eDP-1, preferred, auto, auto" ];

      animations = {
        enabled = true;
        bezier = [
          "simple, 0.16, 1, 0.3, 1"
        ];
        animation = [
          "specialWorkspace, 1, 6, simple, slidevert"
        ];
      };

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
        disable_hyprland_logo = true;
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
        "$mod, L, exec, hyprlock"
        "$mod SHIFT, S, exec, grimblast --freeze --notify copy area"
        "$mod, escape, exec, wlogout"
        "$mod, U, togglespecialworkspace,"
        "$mod SHIFT, U, movetoworkspace, special"
        "$mod, F, fullscreen"
        "$mod, T, togglesplit"
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
