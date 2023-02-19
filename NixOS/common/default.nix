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

    # I use mkOption in favor of mkEnableOption as I want this attribute
    # to be default-true.
    enable = lib.mkOption {
      type = lib.types.bool;
      description = "Enable all common sub-modules at once";
      default = true;
    };

    # cfg: Internal configurations used by the NixOS modules of this repo.
    cfg = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Username to apply configurations to";
        default = "phip1611";
      };
      # This is necessary as "config.system.stateVersion" isn't available for
      # evaluation in NixOS. I do not know why. The state version is for example
      # required for home-manager, so that some state matches the NixOS system.
      stateVersion = lib.mkOption {
        type = lib.types.str;
        description = "State version of the host NixOS system.";
        example = "22.11";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    phip1611.common.user.enable = true;
    phip1611.common.system.enable = true;
  };

}
