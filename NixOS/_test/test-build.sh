#!/usr/bin/env bash

DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit

# I do not use "nixos-rebuild" here. Due to my research, the configuration
# property `nixpkgs.config.allowUnfree = 1` doesn't work because of this reason.
NIXPKGS_ALLOW_UNFREE=1 nix-build --no-out-link
