# NixOS Configuration

This directory contains my common NixOS configurations split into reusable NixOS
modules. You can list all NixOS configurations of this module by typing
`$ ./list-nixos-options.sh`. They are all prefixed with `phip1611`.
Subdirectories have documentation either in a dedicated README or in the Nix
files.

## Compatibility
I use and tested this on a NixOS 22.11 system.

## How to Use
To use this module, you can do:
```nix
# Entry point into the configuration.

{ config, pkgs, ... }:

let
  phip1611Common = builtins.fetchGit https://github.com/phip1611/dotfiles.git;
in
{
  imports =
    [
      # Enables the "phip1611" config property.
      "${phip1611Common}/NixOS"
    ];

  phip1611.common = {
    # Enable all default options.
    enable = true;
    cfg.username = "user-name";
    cfg.stateVersion = "22.11";
    user.env.git.email = "foobar@bar.de";
    user.pkgs.python3.additionalPython3Pkgs = [
      pkgs.python3Packages.pwntools
    ];
  };
}
```
