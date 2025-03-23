{ ... }: {

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "/home/luna/Documents/nix-config/assets/wallpaper.png";

      wallpaper = [
        "DP-1,/home/luna/Documents/nix-config/assets/wallpaper.png"
        "DP-2,/home/luna/Documents/nix-config/assets/wallpaper.png"
        "DP-3,/home/luna/Documents/nix-config/assets/wallpaper.png"
      ];
    };
  };

}
