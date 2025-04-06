{ inputs, ... }: {

  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      { appId = "org.vinegarhq.Sober"; origin = "flathub"; }
      { appId = "com.usebottles.bottles"; origin = "flathub"; }
    ];
  };
}
