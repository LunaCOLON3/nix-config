{ inputs, ... }: {

  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/luna/.config/sops/age/keys.txt";

    secrets.email = {};
  };

}
