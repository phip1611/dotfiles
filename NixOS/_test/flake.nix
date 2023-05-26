# Flake entry into the minimal NixOS configuration for CI.
{
  description = "Minimal NixOS configuration for CI";

  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-23.05;
    };
    nixpkgs-unstable = {
      url = github:NixOS/nixpkgs/nixos-unstable;
    };
    home-manager = {
      url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Relative paths not supported at the moment :/
    # https://github.com/NixOS/nix/issues/3978#issuecomment-952418478
    /*phip1611-common = {
      url = "path:../../NixOS";
    };*/
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@attrs:
    {
      nixosConfigurations.ci = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # Passes the inputs as argument to configuration.nix
        specialArgs = attrs;
        modules = [
          ./configuration.nix
        ];
      };
    };
}
