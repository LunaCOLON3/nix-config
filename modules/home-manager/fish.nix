{ ... }: {
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g theme_color_scheme "catppuccin"
      set -g theme_nerd_fonts "yes"
      set -g theme_title_display_process "yes"
    '';
    shellAbbrs = {
      vi = "nvim";
      vim = "nvim";
    };

    interactiveShellInit = "fastfetch";
  };
}
