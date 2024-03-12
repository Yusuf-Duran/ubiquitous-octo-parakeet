{ lib, fetchFromGitHub, config, pkgs, ... }:
{
  options = {
    wlogout.enable = lib.mkEnableOption "enable wlogout module";
  };

  config = lib.mkIf config.wlogout.enable {
    xdg.configFile = {
      "wlogout/icons/hibernate.png".source = ./icons/hibernate.png;
      "wlogout/icons/lock.png".source = ./icons/lock.png;
      "wlogout/icons/logout.png".source = ./icons/logout.png;
      "wlogout/icons/reboot.png".source = ./icons/reboot.png;
      "wlogout/icons/shutdown.png".source = ./icons/shutdown.png;
      "wlogout/icons/suspend.png".source = ./icons/suspend.png;
    };

    programs.wlogout.enable = true;
    programs.wlogout.layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Logout";
        keybind = "l";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "k";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
    ];
    programs.wlogout.style = ''
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

      * {
        font-size: 14px;
        color: @text;
      }

      window {
        background: @base;
      }

      button {
        background-color: @surface0;
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 35%;
        border-radius: 10px;
        margin: 10px;
      }

      button:focus, button:active, button:hover {
        background-color: alpha(@surface2, 0.5);
        border-width: 2px;
        border-color: @teal;
      }
      
      #lock {
        background-image: url("icons/lock.png");
      }

      #logout {
        background-image: url("icons/logout.png");
      }

      #suspend {
        background-image: url("icons/suspend.png");
      }

      #hibernate {
        background-image: url("icons/hibernate.png");
      }

      #shutdown {
        background-image: url("icons/shutdown.png");
      }

      #reboot {
        background-image: url("icons/reboot.png");
      }

    '';
  };
}
