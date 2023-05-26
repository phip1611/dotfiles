# Common Configurations for my NixOS systems.

{ pkgs, lib, config, options, ... }:

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
    # This is necessary as "config.system.stateVersion" isn't available for
    # evaluation in NixOS.
    stateVersion = lib.mkOption {
      type = lib.types.str;
      description = "State version of the host NixOS system.";
      example = "23.05";
    };
  };
}
