# Flake entry into the minimal NixOS configuration for CI.
{
  description = "Minimal NixOS configuration for CI";

  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-22.11;
    };
    nixpkgs-unstable = {
      url = github:NixOS/nixpkgs/nixos-unstable;
    };
    home-manager = {
      url = github:nix-community/home-manager/release-22.11;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    phip1611-common = {
      # Because of
      # https://github.com/NixOS/nix/issues/3978#issuecomment-952418478
      # the "nix build" command must always be invoked with
      # "--update-input phip1611-common" to copy the latest files into the Nix
      # store. See "test-build.sh".
      url = "path:../../NixOS";
    };
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
