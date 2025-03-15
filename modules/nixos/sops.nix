{ inputs, ... }: {

  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/luna/.config/sops/age/keys.txt";

    secrets.email.owner = "luna";
    
    secrets."userPasswords/luna".neededForUsers = true;
  };

}
