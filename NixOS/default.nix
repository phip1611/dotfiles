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
    usernames = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "Users for that all enabled configurations apply";
      default = [ "phip1611" ];
    };
  };
}
