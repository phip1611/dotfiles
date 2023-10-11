#!/usr/bin/env bash

DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit

set -euo pipefail
IFS=$'\n\t'

# Builds the "ci" attribute of the local flake.
nix-shell --pure \
    -p git nixos-rebuild cacert \
    --run "nixos-rebuild build --flake .#ci" || (echo "❌ FAILURE" && exit 1)

# There is no "--no-out-link" or similar. Hence, we manually remove
# the ./result folder.
rm -f ./result

echo "✅ SUCCESS"
