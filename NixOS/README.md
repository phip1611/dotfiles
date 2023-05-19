# NixOS Configuration

This directory exports a NixOS module made of a bunch of submodules that I
regularly use on (almost all) my machines.

There are the following major submodules available:
- [common](common/README.md): typical environment setup of a system and
  user-specific things, such as the shell and CLI tools
- [network-boot](network-boot/README.md): Network Boot Setup
- [services](services/README.md): systemd Services
- [util-overlay](util-overlay/README.md): utility functions in a Nix overlay

You can list all NixOS configurations of this module by typing
`$ ./list-nixos-options.sh`. They are all prefixed with `phip1611`.
Subdirectories have documentation either in a dedicated README or in the Nix
files.

## Compatibility and Usage
I use and tested this on a NixOS 22.11 system. The module is supposed to be used
via Nix flakes. An example `flake.nix` that describes a full and valid NixOS
configuration may look like this:

```nix
{
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
    # Needs flake inputs "nixpkgs" and "nixpkgs-unstable".
    phip1611-common = {
      type = "github";
      owner = "phip1611";
      repo = "dotfiles";
      dir = "NixOS";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@attrs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # Passes the inputs as argument to configuration.nix
        specialArgs = attrs;
        modules = [
          ./configuration.nix
        ];
      };
    };
}
```

and the corresponding `configuration.nix` may look like this:

```nix
# Entry point into the configuration.

{ config
, pkgs
, lib

  # Flake inputs
, home-manager
, phip1611-common
, ...
}:

let
  stateVersion = "22.11";
in
{
  imports = [
    # Enables the "home-manager" configuration property
    home-manager.nixosModules.home-manager
    # Needs flake inputs "nixpkgs" and "nixpkgs-unstable".
    phip1611-common.nixosModules.phip1611-common
  ];

  # phip1611 dotfiles common NixOS module configuration
  phip1611 = {
    username = "pschuster";
    stateVersion = stateVersion;
    common = {
      enable = true;
      cfg.username = "user-name";
      cfg.stateVersion = "22.11";
      user.env.git.email = "foobar@bar.de";
      user.pkgs.python3.additionalPython3Pkgs = [
        pkgs.python3Packages.pwntools
      ];
    };
    util-overlay.enable = true;
    # to find the other options, look into "_test/configuration.nix" or run
    # the "./list-nixos-options.sh" script.
  };
}
```

and build with `$ nixos-rebuild dry-build --flake .#nixos`.

# Additional Notes
Some NixOS options require a restart of the system to have a fully applied NixOS
config, such as systemd user services.
