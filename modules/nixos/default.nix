{ ... }: {

  imports = [

    ./catppuccin.nix
    ./sops.nix
    ./qt.nix
    ./grub.nix
    ./sddm
    ./sway.nix
    ./polkit.nix

  ];
  
}
