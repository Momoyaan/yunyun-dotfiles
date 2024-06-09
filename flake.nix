{
  description = "Yunyun's simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
    };

  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    aagl,
    ...
  }: {
    nixosConfigurations = {
      yunyun = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/user.nix


          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "backup1";
              extraSpecialArgs = {
                inherit inputs;
              };
              users.yunyun.imports = [./home-manager/default.nix];
            };
          }
          {
            imports = [
              aagl.nixosModules.default
            ];
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
