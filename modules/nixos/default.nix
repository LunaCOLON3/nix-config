{ ... }: {

  imports = [

    ./sops.nix
    ./grub.nix
    ./sddm
    ./nvidia.nix
    ./virtualization.nix
    ./desktop

  ];
  
}
