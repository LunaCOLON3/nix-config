{ pkgs, ... }: let

  wallpaper = ../../assets/wallpaper.png;

in {

  home.packages = with pkgs; [
    swaybg
    autotiling
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;

    extraOptions = [ "--unsupported-gpu" ];

    checkConfig = false;
    
    config = {
      modifier = "Mod4";
      terminal = "kitty fish --init-command fish_fetch";

      bars = [];

      gaps = {
        outer = 5;
        inner = 3;
      };

      output = {
        "*" = {
          background = "${wallpaper} fill";
          scale = "1";
        };
        "DP-3" = {
          pos = "0 0";
        };
        "DP-2" = {
          pos = "1920 0";
          transform = "270";
        };
        "DP-1" = {
          pos = "-1600 180";
        };
      };

      startup = [
        { command = "waybar"; }
        { command = "autotiling"; }
      ];

    };
  };

}
