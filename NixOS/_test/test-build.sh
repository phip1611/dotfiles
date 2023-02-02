#!/usr/bin/env bash

DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit

nix-shell --pure --run "nixos-rebuild dry-build"
