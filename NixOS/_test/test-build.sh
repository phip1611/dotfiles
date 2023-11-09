#!/usr/bin/env bash

set -euo pipefail

DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit

ARG1="${1:-''}"

# First, run unit tests
nix build .\#checks.x86_64-linux.runLibutilTests
rm result

# In CI, we build a smaller configuration to prevent "no space left on device"
# errors, which frequently happened in GitHub CI.
if [ "$ARG1" = "--ci" ]; then
    echo "Running in CI mode."

    echo "Ensuring the full configuration evaluates:"
    nix-shell --pure \
        -p git nixos-rebuild cacert \
        --run "nixos-rebuild dry-build --flake .#full" || (echo "❌ FAILURE" && exit 1)

    echo "Building the \"ci\" NixOS configuration:"
    nix-shell --pure \
        -p git nixos-rebuild cacert \
        --run "nixos-rebuild build --flake .#ci" || (echo "❌ FAILURE" && exit 1)
else
    echo "Running in normal mode."

    echo "Building the \"full\" NixOS configuration:"
    nix-shell --pure \
        -p git nixos-rebuild cacert \
        --run "nixos-rebuild build --flake .#full" || (echo "❌ FAILURE" && exit 1)
fi

# There is no "--no-out-link" or similar for nixos-rebuild. Hence, we manually
# remove the `./result` folder.

rm -f ./result

echo "✅ SUCCESS"
