{ lib, config, inputs, pkgs, rootPath, ... }: let

  inherit (inputs.self.lib.sway) mkDirectionKeys mkExec mkWorkspaceKeys;

  wallpaper = rootPath + /assets/wallpaper.png;

in {

  home.packages = with pkgs; [
    swaybg
    autotiling
  ];

  services.swaync.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;

    extraOptions = [ "--unsupported-gpu" ];

    checkConfig = false;
    
    config = {
      modifier = "Mod4";
      terminal = "kitty fish --init-command fish_fetch";
      menu = "${lib.getExe pkgs.rofi-wayland} -show drun";

      bars = [];

      gaps = {
        outer = -10;
        inner = 20;
      };

      fonts = {
        names = [ "Roboto" ];
        style = "Regular";
        size = 11.0;
      };

      window = {
        border = 2;
        titlebar = false;

        commands = [
          {
            criteria.title = "Volume Control";
            command = "floating enable; sticky enable; resize set 500 500; border normal 0";
          }
          {
            criteria.title = "Add Bluetooth Device";
            command = "floating enable; sticky enable; resize set 500 500; border normal 0";
          }
          {
            criteria.title = "Network Connections";
            command = "floating enable; sticky enable; resize set 500 500; border normal 0";
          }
          {
            criteria.title = "Picture-in-Picture";
            command = "floating enable; sticky enable";
          }
          {
            criteria.instance = "Godot_Engine";
            command = "floating enable";
          }
        ];
      };

      floating = {
        titlebar = true;
        border = 0;
      };

      input = {
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "-0.5";
        };
      };

      output = {
        "*" = {
          background = "${wallpaper} fill";
          scale = "1";
        };
      };

      startup = [
        { command = "autotiling -w 1 -sw 0.85 -sr 1.61"; }
        { command = "autotiling -w 2 -sr 2"; }
        { command = "autotiling -w 3"; }
      ];

      keybindings = let
        swayCfg = config.wayland.windowManager.sway.config;

        mod = swayCfg.modifier;
      in
        lib.mkMerge (
          [
            (mkExec "${mod}+q" swayCfg.terminal)
            (mkExec "${mod}+r" swayCfg.menu)
            (mkExec "${mod}+e" "dolphin")
            (mkExec "${mod}+f" "zen")

            (mkExec "${mod}+Shift+s" "grim -g \"$(slurp)\" - | wl-copy | wl-paste > ~/Pictures/Screenshots/screenshot_$(date +'%s.png')")
          ]
          ++ (
            map (mkWorkspaceKeys mod) ["1" "2" "3" "4" "5" "6" "7" "8" "9"]
          )
          ++ (
            lib.mapAttrsToList (mkDirectionKeys mod) {
              ${swayCfg.left} = "left";
              ${swayCfg.right} = "right";
              ${swayCfg.up} = "up";
              ${swayCfg.down} = "down";
              "Left" = "left";
              "Right" = "right";
              "Up" = "up";
              "Down" = "down";
            }
          )
          ++ (lib.singleton {
            "${mod}+c" = "kill";

            "${mod}+t" = "layout toggle tabbed split";

            "${mod}+Shift+f" = "fullscreen toggle";

            "${mod}+v" = "floating toggle";

            "${mod}+p" = "focus parent";
          })
        );

      colors = {
        background = "$base";

        focused = {
          childBorder = "$pink";
          background = "$pink";
          text = "$mantle";
          indicator = "$pink";
          border = "$pink";
        };

        focusedInactive = {
          childBorder = "$mantle";
          background = "$mantle";
          text = "$text";
          indicator = "$mantle";
          border = "$mantle";
        };

        unfocused = {
          childBorder = "$mantle";
          background = "$mantle";
          text = "$text";
          indicator = "$mantle";
          border = "$mantle";
        };

        urgent = {
          childBorder = "$mauve";
          background = "$mauve";
          text = "$mantle";
          indicator = "$mauve";
          border = "$mauve";
        };

        placeholder = {
          childBorder = "$mantle";
          background = "$mantle";
          text = "$text";
          indicator = "$mantle";
          border = "$mantle";
        };
      };
    };

    extraConfig = ''
      blur enable
      blur_radius 5
      blur_passes 2

      layer_effects "waybar" blur enable
      layer_effects "rofi" blur enable

      exec systemctl --user import-environment XDG_SESSION_TYPE XDG_CURRENT_DESKTOP
      exec dbus-update-activation-environment WAYLAND_DISPLAY
    '';
  };

}
