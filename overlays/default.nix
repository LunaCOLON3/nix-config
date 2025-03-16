{ inputs, ... }: {

  nur = inputs.nur.overlays.default;

  stable = final: prev: {
    stable = import inputs.nixpkgs-stable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  };

}
