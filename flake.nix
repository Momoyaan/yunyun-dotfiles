{
  description = "Yunyun's minipc simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs";
    nvf.url = "github:notashelf/nvf";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = inputs @ {
    nixpkgs,
    nvf,
    ...
  }: {
    nixosConfigurations = {
      minipc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
         nvf.nixosModules.default # <- this imports the NixOS module that provides the options
          ./hosts/user.nix

        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
