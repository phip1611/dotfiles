# This overlay adds additional utility functions to `pkgs`.

self: super:

let
  pkgs = super.pkgs;
  writers = pkgs.callPackage ./writers {};
in
{
  writeZxScriptBin = writers.writeZxScriptBin;
}
