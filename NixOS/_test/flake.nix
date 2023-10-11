# Flake entry into the minimal NixOS configuration for CI.
{
  description = "Minimal NixOS configuration for CI";

  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-23.05;
    };
    nixpkgs-unstable = {
      url = github:NixOS/nixpkgs/master;
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

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }@attrs:
    let
      system = "x86_64-linux";
      pkgsUnstable = import nixpkgs-unstable { config = { allowUnfree = true; }; inherit system; };

      base = configurationsModules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          # Passes the inputs as argument to configuration.nix
          specialArgs = attrs // { inherit pkgsUnstable; };
          modules = [
            home-manager.nixosModules.home-manager
          ] ++ configurationsModules;
        };
    in
    {
      nixosConfigurations = {
        ci = base [ ./configuration.nix ./configuration-ci.nix ];
        full = base [ ./configuration.nix ];
      };
    };
}
