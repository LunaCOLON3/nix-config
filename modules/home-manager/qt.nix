{ pkgs, ... }: {
  
  catppuccin.kvantum.enable = false;

  home.packages = [ pkgs.kdePackages.qt6ct pkgs.kdePackages.breeze-icons ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

}
