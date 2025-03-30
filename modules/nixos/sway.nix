{ pkgs, ... }: {

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    extraOptions = [
      "--unsupported-gpu"
    ];
  };

}
