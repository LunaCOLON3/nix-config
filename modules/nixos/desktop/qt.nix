{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.kdePackages.qt6ct pkgs.kdePackages.breeze-icons ];

  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };

}
