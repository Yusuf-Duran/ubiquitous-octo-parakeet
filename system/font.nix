{lib, config, pkgs, ... }: 
{
  options = {
    font.enable
      = lib.mkEnableOption "enable font module";
  };

  config = lib.mkIf config.font.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "Noto" "JetBrainsMono" "FiraCode" "DroidSansMono" ]; })
    ];
  };
}
