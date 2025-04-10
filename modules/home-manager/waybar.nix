{ lib, pkgs, ... }: {

  programs.waybar = {
    enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    settings = {
      mainBar = {
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "pulseaudio" "network" "bluetooth" "custom/notification" ];

        margin-top = 8;
        margin-left = 8;
        margin-right = 8;

        spacing = 8;

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1" = ""; # this is not a material design circle like the other icons
            "2" = "󰝤";
            "3" = "󰔶";
            "4" = "󰇮";
            "5" = "󰍩";
          };
        };

        pulseaudio = {
          format = "󰕾 {volume}%";
          format-muted = "󰖁 Muted";
          scroll-step = 5;
          on-click = "${lib.getExe pkgs.lxqt.pavucontrol-qt} -t 3";
          tooltip = false;
        };

        network = {
          format = "{ifname}";
          format-wifi = "󰖩 {essid}";
          format-ethernet = "";
          format-disconnected = "󰅤 disconnected";
          tooltip-format = "{ifname}";
          tooltip-format-wifi = "󰖩 {essid} ({signalStrength}%)";
          tooltip-format-disconnected = "Disconnected";
          on-click = "${lib.getExe pkgs.nm-tray}";
          max-length = 50;
          interval = 1;
        };

        bluetooth = {
          format = " {status} ";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";

          on-click = "${pkgs.kdePackages.bluedevil}/bin/bluedevil-wizard";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = " <span foreground='red'><sup></sup></span>";
            none = " ";
            dnd-notification = " <span foreground='red'><sup></sup></span>";
            dnd-none = " ";
            inhibited-notification = " <span foreground='red'><sup></sup></span>";
            inhibited-none = " ";
            dnd-inhibited-notification = " <span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = " ";
          };
          return-type = "json";
          exec-if = "which ${pkgs.swaynotificationcenter}/bin/swaync-client";
          exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          escape = true;
        };
      };
    };

    style = ''
      * {
        color: @text;
        font-family: JetBrainsMonoNL Nerd Font;
      }

      window#waybar {
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      .modules-left, .modules-center, .modules-right {
        margin-right: 8px;
        margin-left: 8px;
      }

      #workspaces {
        margin-left: 0;
      }

      #workspaces button {
        border: none;
        background-color: transparent;
        box-shadow: none;
        border-radius: 16px;
        transition: background-color 100ms ease, color 100ms ease;

        min-width: 32px;
        min-height: 32px;
        padding: 0;
        font-weight: normal;
      }

      #workspaces button:hover {
        background-image: none;
        background-color: transparent;
      }
    '';
  };

}
