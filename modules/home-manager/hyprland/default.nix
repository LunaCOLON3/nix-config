{ ... }: {

  imports = [ ./binds.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      # monitor config
      monitor = [
        "HDMI-A-1, 1920x1080, 0x0, 1"
        "DP-1, 1600x900, 1920x0, 1, transform, 1"
        "DP-2, 1600x900, -1600x180, 1"
      ];

      # startup
      exec-once = [
        "hyprpaper"
        "hyprpanel"
      ];
        
      # environment variables
      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Catppuccin-Mocha-Pink-Cursors"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_QPA_PLATFORM,wayland;xcb"
      ];

      general = {
        gaps_in = "3";
        gaps_out = "5";

        border_size = "2";

        "col.active_border" = "rgba(f5c2e7ee)";
        "col.inactive_border" = "rgba(181825aa)";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      dwindle = {
        preserve_split = true;
      };

    };
  };

}
