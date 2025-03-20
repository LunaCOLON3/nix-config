{ ... }: {

  wayland.windowManager.hyprland = {
    settings = {

      # default programs
      "$mod" = "SUPER";
      "$terminal" = "kitty fish --init-command fish_fetch";
      "$fileManager" = "pcmanfm-qt";
      "$menu" = "rofi -show drun"; 

      # keybinds
      bind = [
        "$mod, f, exec, zen"
        "$mod, q, exec, $terminal"
        "$mod, e, exec, $fileManager"
        "$mod, r, exec, $menu"
        "$mod, v, togglefloating,"
        "$mod, m, exit,"
        "$mod, c, killactive,"
        "$mod, p, swapsplit,"
        "$mod, t, togglesplit,"
        "$mod SHIFT, movetoroot,"


        "$mod SHIFT, s, exec, grim -g \"$(slurp)\" - | wl-copy | wl-paste > ~/Pictures/Screenshots/screenshot_$(date +'%s.png')"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
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
}
