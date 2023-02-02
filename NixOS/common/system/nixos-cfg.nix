{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.system.nixos-cfg;
in
{
  options = {
    phip1611.common.system.nixos-cfg.enable = lib.mkEnableOption "Enable NixOS auto updates";
  };

  config = lib.mkIf cfg.enable {
    # Runs "# nixos-rebuild switch --upgrade" periodically
    # to update all packages from the referenced NixOS channel.
    system.autoUpgrade.enable = true;
    # I prefer no automatic reboots on upgrades.
    system.autoUpgrade.allowReboot = false;
  };
}
