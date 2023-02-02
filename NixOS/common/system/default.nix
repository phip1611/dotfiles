{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./global-editor.nix
    ./latest-linux.nix
    ./nix-cfg.nix
    ./nixos-cfg.nix
    ./sudo.nix
  ];
}
