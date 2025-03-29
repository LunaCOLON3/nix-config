{ pkgs, ... }: let
  
  cfgFile = ./weston.ini;
in {

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    
    settings = {
      Wayland = {
        CompositorCommand = "${pkgs.weston}/bin/weston --shell=kiosk -c ${cfgFile}";
      };
    };
  };

}
