{ pkgs, ... }: {
  
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.85";
    };

    font.package = pkgs.nerd-fonts.jetbrains-mono;
  };

}
