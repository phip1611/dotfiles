{ lib, config, options, ... }:

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
    phip1611.common.system.sudo.enable = true;

    # When unpatched dynamically linked programs are executed, they fail with
    # file not found. Usually, the file "/lib64/ld-linux-x86-x64.so.2" is not
    # found. This NixOS package adds a compatibility layer for that case. Alone,
    # out of the box, this configuration makes no such program work, but it
    # assists trouble shooting by printing:
    #   cannot execute ...: You are trying to run an unpatched binary
    #   on nixos, but you have not configured NIX_LD ... See ... for more
    #   details.
    # https://github.com/Mic92/nix-ld
    programs.nix-ld.enable = true;
  };
}
