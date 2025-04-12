{ inputs, pkgs, ... }: {

  imports = [ ../../modules/home-manager ];

  nixpkgs = {
    overlays = builtins.attrValues (import ../../overlays {inherit inputs;});
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
    bottles
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
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono" ];
    };
  };

  services.flatpak.packages = [
    {
      flatpakref = "https://sober.vinegarhq.org/sober.flatpakref";
      sha256 = "1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l";
    }
  ];

  wayland.windowManager.sway.config.output = {
    "DP-3" = {
      pos = "0 0";
    };
    "DP-2" = {
      pos = "1920 0";
      transform = "270";
    };
    "DP-1" = {
      pos = "-1600 180";
    };
  };


  programs.btop.enable = true;

  services.syncthing.enable = true;

  home.stateVersion = "24.11";
}
