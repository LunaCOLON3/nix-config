{ pkgs, ... }: let

  cfgFile = ./weston.ini;
in {

  catpuccin.sddm.background = ../../../assets/wallpaper.png;

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
