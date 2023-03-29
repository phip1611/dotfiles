# Collection of util functions. Some I use but some are also only here for the
# learning effect. They are added to nixpkgs per overlay. Some are added to
# pkgs.lib while some are added to pkgs directly.

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.util-overlay;
in
{
  imports = [
  ];

  options.phip1611.util-overlay = {
    enable = lib.mkEnableOption "Enable util overlay";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [
      (import ./overlay.nix)
    ];
  };
}
