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
    kdePackages.kdenlive
    vlc
    itch
    noto-fonts
    inkscape
    ninjabrain-bot
    kdePackages.kruler
    piper
    tldr
    godot
    sfxr
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      monospace = [ "JetBrainsMono" ];
    };
  };

  wayland.windowManager.sway.config = {

    startup = [
      { command = "autotiling -w 1 4 7 -sw 0.85 -sr 1.61"; }
      { command = "autotiling -w 2 5 8 -sr 2"; }
      { command = "autotiling -w 3 6 9"; }
    ];

    output = {
      "DP-3" = {
        mode = "1920x1080@75.00Hz";
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

    workspaceOutputAssign = [
      {
        workspace = "1";
        output = "DP-3";
      }
      {
        workspace = "2";
        output = "DP-2";
      }
      {
        workspace = "3";
        output = "DP-1";
      }
      {
        workspace = "4";
        output = "DP-3";
      }
      {
        workspace = "5";
        output = "DP-2";
      }
      {
        workspace = "6";
        output = "DP-1";
      }
      {
        workspace = "7";
        output = "DP-3";
      }
      {
        workspace = "8";
        output = "DP-2";
      }
      {
        workspace = "9";
        output = "DP-1";
      }
    ];
  };

  programs.btop.enable = true;

  services.syncthing.enable = true;

  home.stateVersion = "24.11";
}
