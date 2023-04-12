# Additional functions and other attributes for "pkgs.lib".

{ lib }:

let
  toPretty = lib.generators.toPretty;
  trace = import ./trace.nix { inherit toPretty; };
in
{ } // trace
