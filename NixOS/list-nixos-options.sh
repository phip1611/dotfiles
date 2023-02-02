#!/usr/bin/env bash

DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit

nix-shell -p nixos-option \
    --run "NIXOS_CONFIG=$PWD/default.nix nixos-option phip1611 -r"