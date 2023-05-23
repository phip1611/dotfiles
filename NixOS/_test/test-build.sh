#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit

# Builds the "ci" attribute of the local flake but first, update the local path.
# This is necessary as nix flakes do not automatically update file-system deps.
# However, with `nix build --update-input`, the local path is refreshed inside
# the Nix store.
nix-shell -p nixos-rebuild --run "nix build --update-input phip1611-common &>/dev/null || true"
nix-shell -p nixos-rebuild --run "nixos-rebuild dry-build --flake .#ci"
