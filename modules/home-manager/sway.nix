{ pkgs, ... }: {

  home.packages = with pkgs; [
    swaybg
    autotiling
    swayidle
    swaynotificationcenter
    kdePackages.polkit-kde-agent-1
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    
    checkConfig = false;

    config = {
      modifier = "Mod4";
      terminal = "kitty fish --init-command fish_fetch";

      gaps = {
        outer = 5;
        inner = 3;
      };

      output = {
        "*" = {
          background = toString ../../assets/wallpaper.png;
          scale = "1";
        };
        "DP-3" = {
          pos = "1600 0";
        };
        "DP-2" = {
          pos = "3520 0";
        };
        "DP-1" = {
          pos = "0 180";
        };
      };

      startup = [
        { command = "waybar"; }
        { command = "systemctl --user start polkit-kde-agent-1.service"; }
      ];

    };
  };

}
