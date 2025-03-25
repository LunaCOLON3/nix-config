{ ... }: {

  wayland.windowManager.hyprland = {
    settings = {
      workspace = [
        "r[1], monitor:DP-3, default:true"
        "r[2], monitor:DP-2, default:true"
        "r[3], monitor:DP-1, default:true"
      ];
    };
  };

}
