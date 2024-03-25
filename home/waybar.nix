{ lib, config, pkgs, inputs, ... }:
{
  options = {
    waybar.enable = lib.mkEnableOption "enable waybar module";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainbar = {
          layer = "top";
          position = "top";
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [ "backlight" "battery" "tray" ];
          backlight = {
            device = "intel_backlight";
            format = "{icon} {percent}%";
            format-icons = [ "" "" ];
          };
          tray = {
            icon-size = 21;
            spacing = 10;
            show-passive-items = true;
          };
          battery = {
            interval = 60;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-icons = [ "" "" "" "" "" ];
            max-length = 100;
          };
        };
      };
      style = ''
        @define-color base   #1e1e2e;
        @define-color mantle #181825;
        @define-color crust  #11111b;

        @define-color text     #cdd6f4;
        @define-color subtext0 #a6adc8;
        @define-color subtext1 #bac2de;

        @define-color surface0 #313244;
        @define-color surface1 #45475a;
        @define-color surface2 #585b70;

        @define-color overlay0 #6c7086;
        @define-color overlay1 #7f849c;
        @define-color overlay2 #9399b2;

        @define-color blue      #89b4fa;
        @define-color lavender  #b4befe;
        @define-color sapphire  #74c7ec;
        @define-color sky       #89dceb;
        @define-color teal      #94e2d5;
        @define-color green     #a6e3a1;
        @define-color yellow    #f9e2af;
        @define-color peach     #fab387;
        @define-color maroon    #eba0ac;
        @define-color red       #f38ba8;
        @define-color mauve     #cba6f7;
        @define-color pink      #f5c2e7;
        @define-color flamingo  #f2cdcd;
        @define-color rosewater #f5e0dc;

        @keyframes flash {
          0% { background-color: @red; }
          50% { background-color: transparent; }
          100% { background-color: @red; }
        }

        @keyframes charging {
          0% { background-color: alpha(@teal, 0.6); }
          50% { background-color: alpha(@teal, 0.4); }
          100% { background-color: alpha(@teal, 0.6); }
        }

        @keyframes gradient-animation {
          0% {
            background-position: 0% 50%; /* Start position */
          }
          100% {
            background-position: 100% 50%; /* End position */
          }
        }


        * {
          border: none;
          border-radius: 0;
          color: @text;
          font-family: NotoSansM Nerd Font;
        }

        window#waybar {
          background-color: shade(@base, 0.9);
          border: 2px solid alpha(@crust, 0.3);
          color: #AAB2BF;
        }

        #battery.critical:not(.charging) {
          background: linear-gradient(to right, @red, @maroon);
          background-size: 200% auto; 
          animation: gradient-animation 3s ease infinite; 
        }

        #battery.charging {
          animation: charging 5s infinite;
        }

      '';
    };
  };
}
