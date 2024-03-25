{ lib, config, pkgs, ... }:
{
  options = {
    sounds.enable = lib.mkEnableOption "enable sounds module";
  };

  config = lib.mkIf config.sounds.enable {
    environment.systemPackages = with pkgs; [
      #pwvucontrol
    ];
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.configPackages = [
        (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
          		bluez_monitor.properties = {
          			["bluez5.enable-sbc-xq"] = true,
          			["bluez5.enable-msbc"] = true,
          			["bluez5.enable-hw-volume"] = true,
          			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
          		}
          	'')
      ];

    };
  };
}
