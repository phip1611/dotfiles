# Flake entry into the minimal NixOS configuration for CI.
{
  description = "Minimal NixOS configuration for CI";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.11";
    };
    nixpkgs-unstable = {
      # Use nixpkgs-unstable instead of master so that packages are more likely
      # to be cached already while still being as fresh as possible.
      # See https://discourse.nixos.org/t/differences-between-nix-channels/13998
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    # I don't use a flake input with relative paths here for two reasons:
    # 1) This is a bit cumbersome with Nix; the lock file needs to be updated
    #    manually all the time to track changes
    #    (see https://github.com/NixOS/nix/issues/3978#issuecomment-952418478)
    # 2) There is no fix point. As the lock file changes, the flake input also
    #    changes.
    /*phip1611-common = {
      url = "path:../../NixOS";
    };*/
  };

  outputs =
    inputs@{ flake-parts
    , home-manager
    , nixpkgs
    , nixpkgs-unstable
    , ...
    }:
    let
      system = "x86_64-linux";
      pkgsUnstable = import nixpkgs-unstable { config = { allowUnfree = true; }; inherit system; };
      base = configurationsModules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          # Passes the inputs as argument to configuration.nix
          specialArgs = inputs // { inherit pkgsUnstable; };
          modules = [
            # Import the actual common module.
            # See above why this is no flake.
            ../../NixOS
            home-manager.nixosModules.home-manager
          ] ++ configurationsModules;
        };
    in
    flake-parts.lib.mkFlake { inherit inputs; }
      {
        flake = {
          nixosConfigurations = {
            ci = base [ ./configuration.nix ./configuration-ci.nix ];
            full = base [ ./configuration.nix ];
          };
        };
        # Systems definition for dev shells and exported packages,
        # independent of the NixOS configurations.
        systems = [
          "x86_64-linux"
        ];

        perSystem = { config, pkgs, ... }: {
          devShells = {
            default = pkgs.mkShell {
              packages = with pkgs; [
                nixos-rebuild
                nixpkgs-fmt
              ];
            };
          };

          formatter = pkgs.nixpkgs-fmt;
        };
      };
}
