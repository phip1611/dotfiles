{
  description = "phip1611 common NixOS module";

  # This flake has no inputs as it just exports NixOS configuration modules.
  # Instead, "nixpkgs", "nixpkgs-unstable", and "home-manager" are passed to the
  # function returning the NixOS module in configuration.nix by Nix's natural
  # way of passing arguments to NixOS modules.
  #
  # Hence, a top-level flake describing a full NixOS system passes these
  # parameters to the configuration's entry point.

  outputs = { self }: {
    nixosModules = rec {
      phip1611-common = import ./default.nix;
      default = phip1611-common;
    };
  };
}
