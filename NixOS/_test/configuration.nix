# Minimal configuration that builds a working NixOS system. This is the base
# for the integration test that verifies that my common module is valid.

{ config, pkgs, ... }:

let
  testuser = "foobar";
in
{
  config = {
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;

    # ---------------------------------------------------------------------------
    # Test the properties from my NixOS Module. Use the
    # `$ ./list-nixos-options.sh` utility in this repo to find them all.
    phip1611.username = testuser;
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

    phip1611.network-boot.enable = true;
    phip1611.network-boot.tftpRoot = "/tftpboot";
    phip1611.network-boot.interfaces = [
      {
        interface = "enp4s0";
        hostIp = "192.168.44.100";
        testboxIp = "192.168.44.101";
        hostnameAlias = "testbox";
      }
      {
        interface = "enp4s1";
        hostIp = "192.168.44.200";
        testboxIp = "192.168.44.201";
        hostnameAlias = "testbox2";
      }
    ];

    phip1611.services.meshcommander.enable = true;
    phip1611.services.meshcommander.port = 3000;

    # ---------------------------------------------------------------------------
    # Minimal configuration that builds a working NixOS system.

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
