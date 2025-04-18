{ pkgs, ... }: {

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    extraOptions = [
      "--unsupported-gpu"
    ];
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      sway = {
        prettyName = "Sway";
        comment = "Sway compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/sway";
      };
    };
  };

}
