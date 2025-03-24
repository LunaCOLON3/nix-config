{ ... }: {

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";

      extraConfig = ''
        GRUB_CMDLINE_LINUX="video=DP-1:d"
      '';
    };
    efi.canTouchEfiVariables = true;
  };

}
