{ pkgs, }:

let
  writeZxScriptBin = pkgs.callPackage ./write-zx-script-bin.nix { };
in
{
  inherit writeZxScriptBin;
}
