{ pkgs, config, ... }: {

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    /*
    
    settings = let
      westoncfg = (pkgs.formats.ini { }).generate "weston.ini" {
        libinput = {
          enable-tap = config.services.libinput.mouse.tapping;
          left-handed = config.services.libinput.mouse.leftHanded;
        };
        output = {
          name = "DP-1";
        };
        keyboard = {
          keymap_model = config.services.xserver.xkb.model;
          keymap_layout = config.services.xserver.xkb.layout;
          keymap_variant = config.services.xserver.xkb.variant;
          keymap_options = config.services.xserver.xkb.options;
        };
      };
    in {
      Wayland = {
        CompositorCommand = "${pkgs.weston}/bin/weston --shell=kiosk -c ${westoncfg}";
      };
    };
    */
  };

}
