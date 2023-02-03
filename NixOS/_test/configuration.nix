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
  phip1611.common = {
    cfg.username = testuser;
    enable = true;
    system.enable = true;
    system.global-editor.enable = true;
    system.latest-linux.enable = true;
    system.nix-cfg.enable = true;
    system.nixos-auto-update.enable = true;
    system.sudo.enable = true;
    user.enable = true;
    user.pkgs.dev.enable = true;
    user.pkgs.enable = true;
    user.pkgs.fonts.enable = true;
    user.pkgs.gnome-exts.enable = true;
    user.pkgs.gui.enable = true;
    user.pkgs.python3.additionalPython3Pkgs = [
      pkgs.python3Packages.pwntools
    ];
    user.pkgs.python3.enable = true;
    user.pkgs.shell-utils.enable = true;
  };

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
