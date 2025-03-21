{ pkgs, ... }: {

  home.file.".config/fish/functions".source = ./functions;

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

      g = "git";
    };

    interactiveShellInit = ''
      abbr -a --set-cursor --command git c "commit -am \"%\""

      ${pkgs.any-nix-shell}/bin/any-nix-shell fish | source
      set fish_greeting
    '';
  };
}
