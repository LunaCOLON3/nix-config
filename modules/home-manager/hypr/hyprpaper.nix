{ rootPath, ... }: let
  wallpaper = rootPath + /assets/wallpaper.png;
in {

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = wallpaper;

      wallpaper = [
        "DP-1,${wallpaper}"
        "DP-2,${wallpaper}"
        "DP-3,${wallpaper}"
      ];
    };
  };

}
