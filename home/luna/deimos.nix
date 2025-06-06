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
    obsidian
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

  wayland.windowManager.sway.config = {
    startup = [
      { command = "autotiling"; }
    ];
  };

  programs.btop.enable = true;

  services.syncthing.enable = true;

  home.stateVersion = "24.11";
}
