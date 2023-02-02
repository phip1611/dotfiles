# Common Configurations for my NixOS systems.

{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./common
  ];
}
