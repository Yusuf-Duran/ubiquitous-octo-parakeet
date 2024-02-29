{lib, config, pkgs, ... }:
{
  options = {
    hypr.enable
      = lib.mkEnableOption "enable hypr module";
  };

  config = lib.mkIf config.hypr.enable {
    home.packages = with pkgs; [
      mako
      grimblast
      waybar
      rofi-wayland
      kitty
    ];


    wayland.windowManager.hyprland.enable = true;

    wayland.windowManager.hyprland.settings = {
      decoration = {
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
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
        natural_scroll = true;
        touchpad = {
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

      bind = [
        "$mod, Q, exec, kitty"
        "$mod, R, exec, rofi -show drun"
        "$mod, C, killactive"
        "$mod SHIFT, S, exec, grimblast --freeze --notify copy area"
      ]
      ++ (
        builtins.concatLists (builtins.genList (
          x : let
	    ws = let
	      c = (x + 1) / 10;
	    in 
	      builtins.toString (x + 1 - (c * 10));
	  in [
	    "$mod, ${ws}, workspace, ${toString (x + 1)}"
	    "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
	  ]
        )
        10)
      );
    };
    };
} 
