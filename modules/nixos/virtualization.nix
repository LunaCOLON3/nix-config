{ config, lib, pkgs, ... }: let

  cfg = config.modules.virtualization;

in {

  options.modules.virtualization = { enable = lib.mkEnableOption "Virtualization"; };

  config = lib.mkIf cfg.enable = {

    programs.virt-manager.enable =  true;

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
      waydroid.enable = true;
    };

    environment.systemPackages = with pkgs; [
      virt-viewer
    ];
  };
}
