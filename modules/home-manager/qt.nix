{ pkgs, ... }: {
  
  catppuccin.kvantum.enable = false;

  home.packages = [ pkgs.kdePackages.qt6ct ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

}
