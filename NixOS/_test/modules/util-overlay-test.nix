{ config, pkgs, ... }:

let
  username = builtins.head config.phip1611.usernames;

  # From overlay. Make sure that is used at least once.
  trace = pkgs.phip1611-util;
in
builtins.trace "test module: util-overlay" {
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
