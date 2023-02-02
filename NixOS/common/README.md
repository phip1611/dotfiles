# NixOS Configuration

This directory contains my common NixOS configurations that are generic and can
be imported by any of my NixOS machines. They affect the user environment, such
as environment variables, installed packages, etc. The settings are as much as
possible independent of the underlying hardware and NixOS version. However, some
assumptions, such as a reasonable fresh version of Nixpkgs is required.
