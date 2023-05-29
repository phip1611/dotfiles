# This overlay adds additional functionality to `pkgs`.

_self: super:

let
  pkgs = super.pkgs;
  lib = super.lib;
  utils = import ./utils { inherit lib; };
  writers = import ./writers { inherit pkgs; };
in
{
  phip1611-util = utils;
  writers = { inherit (writers) writeZxScriptBin; };
}
