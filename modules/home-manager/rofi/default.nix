{ pkgs, ... }: {

  home.file.".config/rofi/themes/catppuccin.rasi".source = ./catppuccin.rasi;
  
  catppuccin.rofi.enable = false;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./theme.rasi;

    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      font = "JetBrainsMono Nerd Font 12";
    };

  };

}
