{ lib, ... }: {
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g theme_color_scheme "catppuccin"
      set -g theme_nerd_fonts "yes"
      set -g theme_title_display_process "yes"
    '';
    
    shellAliases = lib.mkMerge [{
      vi = "nvim";
      vim = "nvim";
      "nix develop" = "nix develop --command fish";
    }];

    interactiveShellInit = "fastfetch";
  };
}
