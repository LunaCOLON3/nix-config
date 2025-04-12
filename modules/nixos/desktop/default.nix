{ ... }: let
  
  cfg = config.modules.desktop;

in {

  options.modules.desktop = { enable = lib.mkEnableOption "Desktop Programs"; };

  imports = [
    ./catppuccin.nix
    ./qt.nix
    ./sway.nix
    ./polkit.nix
  ];

}
