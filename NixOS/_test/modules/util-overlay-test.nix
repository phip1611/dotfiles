{ config, pkgs, lib, ... }:

let
  username = config.phip1611.username;

  # From overlay. Make sure that is used at least once.
  trace = pkgs.phip1611-util.tracePrettyVal;
in
{
  phip1611.util-overlay.enable = true;

  # Combo test: "tracePrettyVal" + writeZxScriptBin
  users.users."${username}".packages = trace [
    (pkgs.writers.writeZxScriptBin "foo" ''console.log(1)'')
  ];
}
