# Entry point for the `list-nixos-options.sh` script.
{ config, pkgs, ... }:

let
  homeManager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/refs/heads/release-22.11.tar.gz";
in
{
  imports = [
    (import "${homeManager}/nixos")
    ./default.nix
  ];
}
