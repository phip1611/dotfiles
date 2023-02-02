# This module enables several configuration to add pkgs form nixpkgs, but also
# custom ones, to the active user's environment.
#
# Nix-typically, this doesn't include global header files, such as openssl,
# as this doesn't work with Nix:
# https://nixos.wiki/wiki/FAQ/I_installed_a_library_but_my_compiler_is_not_finding_it._Why%3F

{ pkgs, lib, config, options, ... }:

let
  optionPropBase = "phip1611.user.pkgs";
  cfg = config."${optionPropBase}";
in
{
  imports = [
    ./dev.nix
    ./gui.nix
    ./python3.nix
    ./shell.nix
  ];
}
