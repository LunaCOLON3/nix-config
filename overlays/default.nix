{ inputs, ... }: {

  nur = inputs.nur.overlays.default;

  stable = final: prev: {
    stable = import inputs.nixpkgs-stable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  };

  waybar = final: prev: {
    waybar = prev.waybar.override { withMediaPlayer = true; };
  };

  prismlauncher = final: prev: {

    glfw3-minecraft = prev.glfw3-minecraft.overrideAttrs (old: {
      patches = (old.patches or []) ++ [
        (prev.fetchpatch2 {
          url = "https://raw.githubusercontent.com/tesselslate/waywall/be3e018bb5f7c25610da73cc320233a26dfce948/contrib/glfw.patch";
          hash = "sha256-0w8hpv0zclg42yy1l5rg1yz5hfn4r5q8gbhl7h1fwlazhlaw6pcj=";
        })
      ];
    });

    prismlauncher = prev.prismlauncher.override {
      glfw3-minecraft = final.glfw3-minecraft;
    };
  };

}
