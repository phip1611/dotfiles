{ config, pkgs, lib, ... }:

let
  username = config.phip1611.username;

  # From overlay. Make sure that is used at least once.
  trace = pkgs.phip1611-util;
in
{
  phip1611.util-overlay.enable = true;

  # Combo test: "tracePrettyVal" + writeZxScriptBin
  users.users."${username}".packages =
    trace.tracePretty
      "Trace function works"
      trace.tracePrettyVal
      [
        (pkgs.writers.writeZxScriptBin "foo" ''console.log(1)'')
      ]
  ;
}
