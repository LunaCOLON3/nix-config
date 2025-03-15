{ config, ... }: {

  programs.git = {
    enable = true;
    userName = "LunaCOLON3";
    userEmail = config.sops.secrets."email".path;
  };
  
}
