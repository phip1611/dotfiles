# This overlay adds additional functionality to `pkgs`.

final: prev:

let
  pkgs = final.pkgs;
  lib = final.lib;
  utils = import ./utils { inherit lib; };
  writers = import ./writers { inherit pkgs; };
in
{
  phip1611-util = utils;
  # I'm not entirely sure why, but `writers` is not merged with the existing
  # value but it overrides it. Hence, we merge it manually here.
  writers = { inherit (writers) writeZxScriptBin; } // prev.writers;
}
