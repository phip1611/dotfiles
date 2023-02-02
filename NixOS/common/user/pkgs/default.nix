# This module enables several configuration to add pkgs form nixpkgs, but also
# custom ones, to the active user's environment.
#
# Nix-typically, this doesn't include global header files, such as openssl,
# as this doesn't work with Nix:
# https://nixos.wiki/wiki/FAQ/I_installed_a_library_but_my_compiler_is_not_finding_it._Why%3F

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs;
in
{
  imports = [
    ./dev.nix
    ./gui.nix
    ./python3.nix
    ./shell-utils.nix
  ];

  options = {
    phip1611.common.user.pkgs.enable = lib.mkEnableOption "Enable all pkgs sub-modules at once";
  };

  config = lib.mkIf cfg.enable {
    phip1611.common.user.pkgs.dev.enable = true;
    phip1611.common.user.pkgs.gui.enable = true;
    phip1611.common.user.pkgs.python3.enable = true;
    phip1611.common.user.pkgs.shell-utils.enable = true;
  };
}
