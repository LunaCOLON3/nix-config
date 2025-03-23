{ pkgs, ... }: {
  
  catppuccin.kvantum.enable = false;

  home.packages = with pkgs.kdePackages; [ qt6ct breeze-icons qtstyleplugin-kvantum ];

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };

}
