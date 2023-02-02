# Common Configurations for my NixOS systems.

{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./user
  ];

  options.phip1611 = {
    # cfg: Internal configurations used by the NixOS modules of this repo.
    cfg = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Username to apply configurations to";
        default = "phip1611";
      };
    };
    # Options that affect the environment of user "${phip1611.cfg.username}".
    user = {
      pkgs = {
        gui.enable = lib.mkEnableOption "Enable my typical GUI apps and fonts";
        dev.enable = lib.mkEnableOption "Enable development-related pkgs (gcc, rustup, ...)";
        python3 = {
          enable = lib.mkEnableOption "Enable Python3 toolchain";
          additionalPython3Pkgs = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            description = "Additional Python3 packages";
            default = [];
          };
        };
        shell.enable = lib.mkEnableOption "Enable shell tools (exa, ,...)";
      };
    };
  };

  config = { };

}
