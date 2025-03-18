{ ... }: {

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      # monitor config
      monitor = [
        "HDMI-A-1, 1920x1080, 0x0, 1"
        "DP-1, 1600x900, 1920x0, 1, transform, 1"
        "DP-2, 1600x900, -1600x180, 1"
      ];

      # default programs
      "$mod" = "SUPER";
      "$terminal" = "kitty --hold fastfetch";
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun";

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
        gaps_in = "5";
        gaps_out = "10";

        border_size = "2";

        "col.active_border" = "rgba(f5c2e7ee)";
        "col.inactive_border" = "rgba(181825aa)";

        resize_on_border = true;

        allow_tearing = false;

        layout = "dwindle";
      };

      # keybinds
      bind = [
        "$mod, f, exec, zen"
        "$mod, q, exec, $terminal"
        "$mod, e, exec, $fileManager"
        "$mod, r, exec, $menu"
        "$mod SHIFT, r, exec, sudo $menu"
        "$mod, v, togglefloating,"
        "$mod, m, exit,"
        "$mod, c, killactive,"

        "$mod SHIFT, s, exec, grim -g \"$(slurp)\" - | wl-copy | wl-paste > ~/Pictures/Screenshots/screenshot_$(date +'%s.png')"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9)
      );
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "/home/luna/Documents/nix-config/assets/wallpaper.png";

      wallpaper = [
        "HDMI-A-1,/home/luna/Documents/nix-config/assets/wallpaper.png"
        "DP-2,/home/luna/Documents/nix-config/assets/wallpaper.png"
        "DP-1,/home/luna/Documents/nix-config/assets/wallpaper.png"
      ];
    };
  };
}
