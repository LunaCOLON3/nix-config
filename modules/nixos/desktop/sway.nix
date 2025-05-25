{ pkgs, ... }: {

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    extraOptions = [
      "--unsupported-gpu"
    ];
  };

  xdg = {
  portal = {
    enable = true;
    extraPortals = with pkgs; [
      # wlroots specific
      # use xdg-desktop-portal-gtk for gnome.
      xdg-desktop-portal-wlr
    ];
    # uncomment for gnome
    # gtkUsePortal = true;
  };
};

xdg.portal.wlr.settings = {
  screencast = {
    # set the output_name (this doesn't really matter)
	  output_name = "HDMI-A";
	  max_fps = 60;
	  chooser_type = "simple";
	  chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";		
  };
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
