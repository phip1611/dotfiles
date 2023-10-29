# Common Configurations for my NixOS systems.

{ lib, options, ... }:

{
  imports = [
    ./common
    ./network-boot
    ./services
    ./util-overlay
  ];

  options.phip1611 = {
    username = lib.mkOption {
      # users = lib.mkOption {
      # type = lib.types.listOf lib.types.str;
      type = lib.types.str;
      description = "User for that all enabled configurations apply";
      default = "phip1611";
    };
  };
}
