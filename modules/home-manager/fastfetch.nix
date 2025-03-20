{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        source = "/home/luna/Documents/nix-config/assets/nixos-ascii.txt";
        type = "file";
        color = {
          "1" = "magenta";
          "2" = "blue";
          "3" = "38;2;245;245;255";
        };
      };
      display = {
        color = "magenta";
        separator = " : ";
        constants = [
          "───────────"
        ];
        key = {
          type = "icon";
          paddingLeft = 2;
        };
      };
      modules = [
        {
          type = "title";
          format = "┌{$1}───── {#1}{user-name}@{host-name}{#1} ─────{$1}┐";
        }
        "os"
        "host"
        {
          type = "kernel";
          format = "{release}";
        }
        "uptime"
        "shell"
        {
          type = "display";
          compactType = "original";
          key = "Resolution";
        }
        "de"
        "wm"
        "wmtheme"
        "theme"
        "terminal"
        {
          type = "terminalfont";
          format = "{/name}{-}{/}{name}{?size} {size}{?}";
        }
        "cpu"
        {
          type = "gpu";
          key = "GPU";
          format = "{name}";
        }
        {
          type = "memory";
          format = "{} / {}";
        }
        {
          type = "custom";
          format = "└{$1}────────────────────────{$1}┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
