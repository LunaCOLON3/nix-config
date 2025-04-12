{ config, lib, ... }: let
  
  cfg = config.modules.nvidia;

in {

  options.modules.nvidia = { enable = lib.mkEnableOption "NVIDIA GPU Drivers"; };

  config = lib.mkIf cfg.enable = {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };
}
