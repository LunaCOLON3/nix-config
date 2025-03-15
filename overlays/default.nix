{ inputs, ... }: {

  nur = inputs.nur.overlays.default;

  overlay-unstable = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  };

}
