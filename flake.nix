{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:LunaCOLON3/zen-browser-nix";
      # url = "path:/home/luna/Documents/zen-browser-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let

    rootPath = self;

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in
  {

    nixosConfigurations = {
      eclipse = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs rootPath;};
        modules = [ ./hosts/eclipse/configuration.nix ];
      };

      phobos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs rootPath;};
        modules = [ ./hosts/phobos/configuration.nix ];
      };

      deimos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs rootPath;};
        modules = [ ./hosts/deimos/configuration.nix ];
      };
    };

    homeConfigurations = {
      "luna@eclipse" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs rootPath; };
        modules = [ ./home/luna/eclipse.nix ];
      };
      "luna@phobos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/luna/phobos.nix ];
      };
      "luna@deimos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/luna/deimos.nix ];
      };
    };

    lib = import ./lib;

  };
}
