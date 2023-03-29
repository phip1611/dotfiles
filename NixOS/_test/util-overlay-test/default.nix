# Minimal configuration that is accepted by "nixos-rebuild" + import of
# modules to test.

username:

{ config, pkgs, ... }:


{
  phip1611.util-overlay.enable = true;

  users.users."${username}".packages = [
    (pkgs.writeZxScriptBin "foo" ''console.log(1)'')
  ];
}
