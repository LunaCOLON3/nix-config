{ pkgs, lib, ... }: {

  security.polkit.enable = true;

  systemd.user.services."lxqt-policykit-agent" = {
    description = "LXQt PolicyKit Agent";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = lib.getExe pkgs.lxqt.lxqt-policykit;
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

}
