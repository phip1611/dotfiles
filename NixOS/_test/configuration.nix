# Minimal configuration that builds a working NixOS system. This is the base
# for the integration test that verifies that my common module is valid.

{ config, pkgs, ... }:

let
  testuser = "foobar";
in
{
  imports = [
    # My common module that I want to test.
    # Nix flake inputs currently do not support relative paths. Hence, I import
    # this module the legacy way.. as a consequence, I do not really test if the
    # flake definition is fine. However, this should be fine for now.
    # phip1611-common.nixosModules.phip1611-common
    ../../NixOS

    # Actual tests that test the configuration properties from my module put
    # into smaller sub-modules.
    ./modules
  ];

  config = {
    system.stateVersion = "23.05";

    # ---------------------------------------------------------------------------
    # Test the properties from my NixOS Module. Use the
    # `$ ./list-nixos-options.sh` utility in this repo to find them all.
    phip1611.usernames = [ testuser ];
    phip1611.common.enable = true;
    phip1611.common.system.docker.rootless.enable = true;
    phip1611.common.system.documentation.enable = true;
    phip1611.common.system.enable = true;
    phip1611.common.system.firmware.enable = true;
    phip1611.common.system.latest-linux.enable = true;
    phip1611.common.system.nix-cfg.enable = true;
    phip1611.common.system.nix-ld.enable = true;
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

    boot.loader.systemd-boot.enable = true;

    users.users."${testuser}".isNormalUser = true;

    # Some root file system so that nixos-rebuild doesn't fail.
    # The device UUID is chosen at will.
    fileSystems."/" =
      {
        device = "/dev/disk/by-uuid/510da090-fb98-458e-86e1-bfd728741d02";
        fsType = "ext4";
      };
  };

}
