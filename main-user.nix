{lib, config, pkgs, ... }: 
{
  options = {
    main-user.enable
      = lib.mkEnableOption "enable user module";
    
    main-user.userName = lib.mkOption {
      default = "yusuf";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf config.main-user.enable {
    users.users.${config.main-user.userName} = {
      isNormalUser = true;
      initialPassword = "12345";
      extraGroups = ["wheel" "networkmanager"];
      description = "main user";
      shell = pkgs.fish;
    };
  };
}
