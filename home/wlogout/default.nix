{ lib, fetchFromGitHub, config, pkgs, ... }:
{
  imports = [
    ./catppuccin.nix
  ];

  options = {
    wlogout.enable = lib.mkEnableOption "enable wlogout module";
  };

  config = lib.mkIf config.wlogout.enable {
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
        border-width: 1px;
        background-repeat: no-repeat;
        background-position: center;
        border-radius = 0.5rem;
        margin: 5rem;
      }
      button:focus, button:active, button:hover {
        background-color: alpha(@surface2, 0.5);
        border-color: @teal;
      }
      
    '';
  };
}
