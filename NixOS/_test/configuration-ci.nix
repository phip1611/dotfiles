# Additional configuration that is needed in CI.

{ config, pkgs, lib, ... }:

{
  # Deactivate GUI as this is
  # 1) rather simple and
  # 2) often results in "no space left on device" errors in GitHub CI
  phip1611.common.user.pkgs.gui.enable = lib.mkForce false;
}