{ inputs, ... }: {

  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;

    settings.theme.name = "catppuccin_mocha";

    settings = {
      bar.launcher.icon = "";
    };

    override = {
      theme.bar.opacity = 90;
      theme.bar.dashboard.icon = "#f5c2e7";
      theme.bar.buttons.dashboard.icon = "#f5c2e8";
      theme.font.size = "1rem";
    };
    
    settings.layout = {
      "bar.layouts" = {
        "2" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [ "volume" "network" "bluetooth" "systray" "clock" "notifications" ];
        };
        "1" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [ "volume" "clock" "notifications" ];
        };
        "0" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [ "volume" "systray" "notifications" ];
        };
      };
    };

  };
}
