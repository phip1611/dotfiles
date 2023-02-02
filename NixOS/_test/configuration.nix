# Minimal configuration suitable to be accepted by "nixos-rebuild".

{ config, pkgs, ... }:

let
  testuser = "foobar";
in
{
  imports = [
    ../../NixOS
  ];

  # ---------------------------------------------------------------------------
  # test the properties from my NixOS Module
  phip1611.common = {
    cfg.username = testuser;

    # test combined settings
    enable = true;
    user.enable = true;
    user.pkgs.enable = true;
    system.enable = true;


    # also test individual settings
    system.global-editor.enable = true;
    system.latest-linux.enable = true;
    system.nix-cfg.enable = true;
    system.nixos-auto-update.enable = true;
    system.sudo.enable = true;
    user.pkgs.dev.enable = true;
    user.pkgs.gui.enable = true;
    user.pkgs.python3.enable = true;
    user.pkgs.python3.additionalPython3Pkgs = [
      pkgs.python3Packages.pwntools
    ];
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
