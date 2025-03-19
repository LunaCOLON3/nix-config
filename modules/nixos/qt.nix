{ pkgs, ... }: {

  catppuccin.kvantum.enable = false;

  environment.systemPackages = [ pkgs.kdePackages.qt6ct ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = "kvantum";
  };

}
