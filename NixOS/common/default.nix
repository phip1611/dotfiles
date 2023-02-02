# Common Configurations for my NixOS systems.

{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./user
  ];

  options.phip1611.common = {
    # cfg: Internal configurations used by the NixOS modules of this repo.
    cfg = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Username to apply configurations to";
        default = "phip1611";
      };
    };
  };

  config = { };

}
