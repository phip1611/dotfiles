{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.system;
in
{
  imports = [
    ./documentation.nix
    ./firmware.nix
    ./latest-linux.nix
    ./nix-cfg.nix
    ./nix-path-from-flake.nix
    ./nixos-auto-update.nix
    ./sudo.nix
  ];

  options = {
    phip1611.common.system.enable = lib.mkEnableOption "Enable all system sub-modules at once";
  };

  config = lib.mkIf cfg.enable {
    phip1611.common.system.documentation.enable = true;
    phip1611.common.system.firmware.enable = true;
    phip1611.common.system.latest-linux.enable = true;
    phip1611.common.system.nix-cfg.enable = true;
    phip1611.common.system.nix-path-from-flake.enable = true;
    phip1611.common.system.nixos-auto-update.enable = true;
    phip1611.common.system.sudo.enable = true;
  };
}
