# Entry point for the `list-nixos-options.sh` script.
{ config, pkgs, ... }:

let
  homeManagerVersion = "23.05";
  homeManager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/refs/heads/release-${homeManagerVersion}.tar.gz";
in
{
  imports = [
    (import "${homeManager}/nixos")
    ./default.nix
  ];
}
