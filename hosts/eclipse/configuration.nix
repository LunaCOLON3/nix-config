{ inputs, config, pkgs, options, rootPath, ... }: {

  imports = [ (rootPath + /modules/nixos) ./hardware-configuration.nix ];

  modules = {
    nvidia.enable = true;
    virtualization.enable = true;
  };

  nixpkgs = {
    overlays = builtins.attrValues (import (rootPath + /overlays) {inherit inputs;});
    config = {
      allowUnfree = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.nixPath =
    # Prepend default nixPath values.
    options.nix.nixPath.default ++
    # Append our nixpkgs-overlays.
    [ "nixpkgs-overlays=/etc/nixos/overlays-compat/" ]
  ;

  networking = {
    hostName = "eclipse";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users = {
    luna = {
      isNormalUser = true;
      description = "Luna";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      shell = pkgs.fish;
      hashedPasswordFile = config.sops.secrets."userPasswords/luna".path;
    };
  };

  boot.plymouth.enable = true;

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
    xpadneo.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    xserver = {
      enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    flatpak.enable = true;
    printing.enable = true;
    hardware.openrgb.enable = true;

    pulseaudio.enable = false;
  };

  programs = {
    steam.enable = true;
    fish.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        (glfw-wayland-minecraft.overrideAttrs (old: {
          patches = [
            (fetchpatch2 {
              url = "https://raw.githubusercontent.com/tesselslate/waywall/012851ff6ac4ed7b74dc41683f275b8384ce36a7/doc/assets/glfw.patch";
              hash = "sha256-2PYmEUJVO9WrTbvnZp+RgJ9tTIqB9q4QVeABplH0tQY=";
            })
          ];
        }))
      ];
    };
    virt-manager.enable = true;
    
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    kitty
    gtk3
    fuse
    hyprpolkitagent
    fbset
    kdePackages.partitionmanager
    kdePackages.isoimagewriter
    waywall
    networkmanagerapplet
    (glfw-wayland-minecraft.overrideAttrs (old: {
          patches = [
            (fetchpatch2 {
              url = "https://raw.githubusercontent.com/tesselslate/waywall/012851ff6ac4ed7b74dc41683f275b8384ce36a7/doc/assets/glfw.patch";
              hash = "sha256-2PYmEUJVO9WrTbvnZp+RgJ9tTIqB9q4QVeABplH0tQY=";
            })
          ];
        }))
  ];

  fonts.packages = with pkgs; [
    (stable.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  system.stateVersion = "24.11";
}

