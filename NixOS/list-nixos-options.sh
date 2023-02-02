#!/usr/bin/env bash

nix-shell -p nixos-option \
    --run "NIXOS_CONFIG=$PWD/default.nix nixos-option phip1611 -r"
