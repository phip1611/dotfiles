{ pkgs, lib, config, options, nixpkgs, ... }:

let
  cfg = config.phip1611.common.system.nix-path-from-flake;
  username = config.phip1611.username;
in
{
  options = {
    phip1611.common.system.nix-path-from-flake.enable = lib.mkEnableOption "Enable to set NIX_PATH and Nix registry to the active nixpkgs flake";
  };

  config = lib.mkIf cfg.enable {
    nix = {
      # Set the nix channel to the one that comes from my NixOS configurations's
      # flake. I still sometimes use Nix channels for quick prototyping.
      nixPath = [
        "nixpkgs=${nixpkgs}"
      ];
      registry.nixpkgs.flake = nixpkgs;
    };
  };
}
