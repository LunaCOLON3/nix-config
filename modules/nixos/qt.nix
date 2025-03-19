{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.kdePackages.qt6ct ];

  qt = {
    enable = true;
    platformTheme = "qt6ct";
    style = "kvantum";
  };

}
