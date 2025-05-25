{ pkgs, ... }: {

  home.file.".config/fish/functions".source = ./functions;

  programs.fish = {
    enable = true;

    shellInit = ''
      set -g theme_color_scheme "catppuccin"
      set -g theme_nerd_fonts "yes"
      set -g theme_title_display_process "yes"
    '';

    shellAliases = {
      icat = "kitten icat";

      vi = "nvim";
      vim = "nvim";

      gr = "cd $(git rev-parse --show-toplevel)";
    };

    shellAbbrs = {
      g = "git";
    };

    interactiveShellInit = ''
      abbr -a --set-cursor --command git c "commit -am \"%\""
      abbr -a --command git a "add ."

      ${pkgs.any-nix-shell}/bin/any-nix-shell fish | source
      set fish_greeting
    '';
  };
}
