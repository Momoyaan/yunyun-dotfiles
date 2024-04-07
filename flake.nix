{
  description = "Yunyun's simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, home-manager, aagl, ... }: {
    nixosConfigurations = {
      yunyun = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/user.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = {
                  inherit inputs;
                };
                users.yunyun.imports = [ ./home-manager/default.nix  ];
              };

          }
        {
          imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
          programs.honkers-railway-launcher.enable = true;
        }
        ];
	specialArgs = {
	  inherit inputs;
	};
      };
    };
  };
}
