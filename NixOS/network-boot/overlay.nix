# This overlay adds additional utility functions to `pkgs`.

self: super:

let
  pkgs = super.pkgs;
  ipxeNetworkBoot = pkgs.callPackage ./ipxe.nix { };
in
{
  inherit ipxeNetworkBoot;
}
