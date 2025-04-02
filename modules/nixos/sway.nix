{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    kdePackages.polkit-kde-agent-1
  ];

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    extraOptions = [
      "--unsupported-gpu"
    ];
  };

}
