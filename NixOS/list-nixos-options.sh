#!/usr/bin/env bash

DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit

# Requires <nixpkgs> in NIX_PATH
nix-shell -p nixos-option \
    --run "NIXOS_CONFIG=$PWD/list-nixos-options.nix nixos-option phip1611 -r"
