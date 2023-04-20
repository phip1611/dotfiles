{ pkgs, }:

let
  writeZxScriptBin = import ./write-zx-script-bin.nix { inherit pkgs; };
in
{
  inherit writeZxScriptBin;
}
