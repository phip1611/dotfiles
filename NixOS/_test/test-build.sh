#!/usr/bin/env bash

DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit

# Builds the "ci" attribute of the local flake.
nix-shell -p nixos-rebuild --run "nixos-rebuild dry-build --flake .#ci"
