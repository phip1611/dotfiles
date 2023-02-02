# Common Configurations for my NixOS systems.

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common;
in
{
  imports = [
    ./system
    ./user
  ];

  options.phip1611.common = {
    enable = lib.mkEnableOption "Enable all common sub-modules at once";

    # cfg: Internal configurations used by the NixOS modules of this repo.
    cfg = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Username to apply configurations to";
        default = "phip1611";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    phip1611.common.user.enable = true;
    phip1611.common.system.enable = true;
  };

}
