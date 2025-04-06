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

  programs.btop.enable = true;

  services.syncthing.enable = true;

  home.stateVersion = "24.11";
}
