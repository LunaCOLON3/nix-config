{ pkgs, ... }: {

  home.file.".config/rofi/themes/catppuccin-mocha.rasi".source = ./catppuccin-mocha.rasi;
  
  catppuccin.rofi.enable = false;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./catppuccin-default.rasi;

    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      font = "JetBrainsMono Nerd Font 12";
    };

  };

}
