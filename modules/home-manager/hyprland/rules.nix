{ ... }: {

  wayland.windowManager.hyprland = {
    settings = {
      workspace = [
        "1, monitor: DP-3, default:true"
        "2, monitor: DP-2, default:true"
        "3, monitor: DP-1, default:true"
      ];
    };
  };

}
