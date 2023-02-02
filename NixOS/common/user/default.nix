{ pkgs, lib, config, options, ... }:

let
  optionPropBase = "phip1611.user";
  cfg = config."${optionPropBase}";
in
{
  imports = [
    ./pkgs
  ];

}
