# Minimal configuration that is accepted by "nixos-rebuild" + import of
# modules to test.

# The inputs are by the inputs of the Nix flake, such as "nixpkgs-unstable".
{ config
, pkgs
, system

  # Flake inputs
, nixpkgs
, nixpkgs-unstable
, home-manager
  #, phip1611-common
, ...
}:

let
  testuser = "foobar";
  stateVersion = "22.11";
in
{
  imports = [
    # My common module that I want to test.
    # Nix flake inputs currently do not support relative paths. Hence, I import
    # this module the legacy way.. as a consequence, I do not really test if the
    # flake definition is fine. However, this should be fine for now.
    # phip1611-common.nixosModules.phip1611-common
    ../../NixOS

    # Enables the "home-manager" configuration property.
    home-manager.nixosModules.home-manager

    # Actual tests that test the configuration properties from my module put
    # into smaller sub-modules.
    ./modules
  ];

  # ---------------------------------------------------------------------------
  # Test the properties from my NixOS Module. Use the `$ list-nixos-options.sh`
  # to find all.
  phip1611.stateVersion = stateVersion;
  phip1611.username = testuser;
  phip1611.common.enable = true;
  phip1611.common.system.documentation.enable = true;
  phip1611.common.system.enable = true;
  phip1611.common.system.firmware.enable = true;
  phip1611.common.system.latest-linux.enable = true;
  phip1611.common.system.nix-cfg.enable = true;
  phip1611.common.system.nix-path-from-flake.enable = true;
  phip1611.common.system.sudo.enable = true;
  phip1611.common.user.enable = true;
  phip1611.common.user.env.enable = true;
  phip1611.common.user.env.git.email = "phip1611@gmail.com";
  phip1611.common.user.env.git.username = "Philipp Schuster";
  phip1611.common.user.env.excludeGui = false;
  phip1611.common.user.pkgs.cli.enable = true;
  phip1611.common.user.pkgs.custom.enable = true;
  phip1611.common.user.pkgs.dev.enable = true;
  phip1611.common.user.pkgs.doc.enable = true;
  phip1611.common.user.pkgs.enable = true;
  phip1611.common.user.pkgs.fonts.enable = true;
  phip1611.common.user.pkgs.gnome-exts.enable = true;
  phip1611.common.user.pkgs.gui.enable = true;
  phip1611.common.user.pkgs.media.enable = true;
  phip1611.common.user.pkgs.python3.additionalPython3Pkgs = [
    # some random package
    pkgs.python3Packages.pwntools
  ];
  phip1611.common.user.pkgs.python3.enable = true;

  phip1611.services.meshcommander.enable = true;
  phip1611.services.meshcommander.port = 3000;

  # ---------------------------------------------------------------------------

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = stateVersion;

  boot.loader.systemd-boot.enable = true;

  users.users."${testuser}".isNormalUser = true;

  # Some root file system so that nixos-rebuild doesn't fail.
  # The device UUID is chosen at will.
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/510da090-fb98-458e-86e1-bfd728741d02";
      fsType = "ext4";
    };
}
