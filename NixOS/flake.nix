{
  description = "phip1611 common NixOS module";

  # This flake has no inputs as it just exports NixOS configuration modules.
  # It does not export full NixOS configuration or a flake that can be build!
  # It just serves as entry point to export `default.nix`.
  #
  # Please look at the flake.nix of the integration test to learn how to
  # properly prepare and pass the flake inputs nixpkgs, nixpkgs-unstable, and
  # home-manager for the common NixOS module.

  outputs = { ... }: {
    nixosModules = rec {
      phip1611-common = import ./default.nix;
      default = phip1611-common;
    };
  };
}
