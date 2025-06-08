{ lib, pkgs, ... }: {

  programs.waybar = {
    enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    settings = {

      mainBar = {
        modules-left = [ "custom/nixos" "sway/workspaces" "sway/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "network" "bluetooth" "battery" "pulseaudio" "custom/notification" ];

        margin-top = 10;
        margin-left = 10;
        margin-right = 10;

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
        };

        "sway/window" = {
          max-length = 50;
          all-outputs = true;
        };

        pulseaudio = {
          format = "󰕾";
          format-muted = "󰖁";
          tooltip-format = "{volume}%";
          tooltip-format-muted = "Muted";
          scroll-step = 5;
          on-click = "${lib.getExe pkgs.lxqt.pavucontrol-qt} -t 3";
        };

        network = {
          format = "";
          format-wifi = "󰖩";
          format-ethernet = "";
          format-disconnected = "󰅤";
          tooltip-format = "{ifname}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-disconnected = "Disconnected";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
          max-length = 50;
          interval = 1;
        };

        bluetooth = {
          format = "";
          format-connected = "<span foreground='blue'><sup></sup></span>";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";

          on-click = "${pkgs.kdePackages.bluedevil}/bin/bluedevil-wizard";
        };

        clock = {
          format = "{:%I:%M %p - %D}";
          interval = 1;
          locale = "en_US.UTF-8";
          timezone = "America/Los_Angeles";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "󱅫";
            none = "󰂚";
            dnd-notification = "󱅫";
            dnd-none = "󰂛";
            inhibited-notification = "󱅫";
            inhibited-none = "󰂚";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "󰂛";
          };
          return-type = "json";
          exec-if = "which ${pkgs.swaynotificationcenter}/bin/swaync-client";
          exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          escape = true;
        };

        "custom/media" = {
          format = "{icon} {}";
          format-icons = {
            spotify = "";
            default = "";
          };
          escape= true;
          return-type = "json";
          max-length = 40;
          on-click = "playerctl play-pause";
          on-click-right = "playerctl stop";
          smooth-scrolling-threshold = 10;
          on-scroll-up = "playerctl next";
          on-scroll-down = "playerctl previous";
          exec = "waybar-mediaplayer.py 2> /dev/null";
        };

        "custom/nixos" = {
          format = "";
          tooltip = false;
        };
      };
    };

    style = ''
      * {
        color: @text;
        font-family: JetBrains Mono Nerd Font;
        font-size: 11pt;
        border-radius: 0px;
        padding: 0px;
      }

      window#waybar {
        background-color: @base;
        border: 2px solid @mantle;
      }

      #battery,
      #network,
      #clock,
      #custom-media,
      #custom-notification,
      #window,
      #tray,
      #workspaces,
      #pulseaudio,
      #custom-nixos,
      #bluetooth {
        margin: 6px;
      }

      #custom-nixos {
        margin-left: 12px
      }

      #custom-notification {
        margin-right: 12px
      }
    '';
  };

}
