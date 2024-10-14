{
  description = "Yunyun's minipc simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs";
    agenix.url = "github:ryantm/agenix";

  };

  outputs = inputs @ {
    nixpkgs,
    agenix,
    ...
  }: {
    nixosConfigurations = {
      minipc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/user.nix
          agenix.nixosModules.default
          {
          environment.systemPackages = [ agenix.packages.x86_64-linux.default ];
          }
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
