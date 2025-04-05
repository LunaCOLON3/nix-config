{ rootPath, pkgs, ... }: let

  cfgFile = ./weston.ini;
in {

  catppuccin.sddm.background = rootPath + /assets/wallpaper-extrablur.png;

  services.displayManager.defaultSession = "sway-uwsm";

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
