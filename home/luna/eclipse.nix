{ inputs, pkgs, rootPath, ... }: {

  imports = [ (rootPath + /modules/home-manager) ];

  nixpkgs = {
    overlays = builtins.attrValues (import (rootPath + /overlays) {inherit inputs;});
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "luna";
    homeDirectory = "/home/luna";
  };

  home.packages = with pkgs; [
    vesktop
    prismlauncher
    obs-studio
    blueman
    protonvpn-gui
    wget
    unzip
    wl-clipboard
    grim
    slurp
    google-chrome
    jdk
    qbittorrent
    (retroarch.withCores (cores: with cores; [
      desmume
    ]))
    protonup-qt
    gh
    gimp
    sops
    keepassxc
    any-nix-shell
    (stable.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    kdePackages.dolphin
    kdePackages.ark
    vlc
    itch
    noto-fonts
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      monospace = [ "JetBrainsMono" ];
    };
  };

  wayland.windowManager.sway.config.output = {
    "DP-3" = {
      pos = "1600 0";
    };
    "DP-2" = {
      pos = "3520 0";
      transform = "270";
    };
    "DP-1" = {
      pos = "0 180";
    };
  };

  programs.btop.enable = true;

  services.syncthing.enable = true;

  home.stateVersion = "24.11";
}
