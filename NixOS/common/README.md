# NixOS Configuration

This directory contains my common NixOS configurations that are generic and can
be imported by any of my NixOS machines. They affect the user environment, such
as environment variables, installed packages, etc. The settings are as much as
possible independent of the underlying hardware and NixOS version. However, some
assumptions, such as a reasonable fresh version of Nixpkgs is required.

## Example Configuration

```nix
{ pkgs, ...}:

# example with all configuration options of this module

{
  imports = [
    /path/to/dotfiles/NixOS/common
  ];

  # Username to apply configurations to.
  phip1611.cfg.username = "pschuster";
  phip1611.user.pkgs.dev.enable = true;
  phip1611.user.pkgs.gui.enable = true;
  phip1611.user.pkgs.python3.enable = true;
  phip1611.user.pkgs.python3.additionalPython3Pkgs = [
    # pkgs.python3Packages.pwntools
  ];
  phip1611.user.pkgs.shell.enable = true;
}
```
