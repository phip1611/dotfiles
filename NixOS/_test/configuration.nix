# Minimal configuration that is accepted by "nixos-rebuild" + import of
# modules to test.

{ config, pkgs, ... }:

let
  testuser = "foobar";
in
{
  imports = [
    ../../NixOS
  ];

  # ---------------------------------------------------------------------------
  # Test the properties from my NixOS Module. Use the `$ list-nixos-options.sh`
  # to find all.
  phip1611.common.cfg.username = testuser;
  phip1611.common.enable = false;
  phip1611.common.system.documentation.enable = false;
  phip1611.common.system.enable = false;
  phip1611.common.system.firmware.enable = false;
  phip1611.common.system.global-editor.enable = false;
  phip1611.common.system.latest-linux.enable = false;
  phip1611.common.system.nix-cfg.enable = false;
  phip1611.common.system.nixos-auto-update.enable = false;
  phip1611.common.system.sudo.enable = false;
  phip1611.common.user.enable = false;
  phip1611.common.user.pkgs.cli.enable = false;
  phip1611.common.user.pkgs.custom.enable = false;
  phip1611.common.user.pkgs.dev.enable = false;
  phip1611.common.user.pkgs.enable = false;
  phip1611.common.user.pkgs.fonts.enable = false;
  phip1611.common.user.pkgs.gnome-exts.enable = false;
  phip1611.common.user.pkgs.gui.enable = false;
  phip1611.common.user.pkgs.python3.additionalPython3Pkgs = [ ];
  phip1611.common.user.pkgs.python3.enable = false;


  # ---------------------------------------------------------------------------

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";

  boot.loader.systemd-boot.enable = true;

  users.users."${testuser}".isNormalUser = true;

  # Some root file system so that nixos-rebuild doesn't fail.
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/510da090-fb98-458e-86e1-bfd728741d02";
      fsType = "ext4";
    };
}
