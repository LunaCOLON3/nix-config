{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
  ];

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    extraOptions = [
      "--unsupported-gpu"
    ];
  };

}
