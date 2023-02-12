{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  imports = [
  ];

  options = {
    phip1611.common.user.env.enable = lib.mkEnableOption "Enable all user-environmental options (shell, homemanager, dotfiles, ...)";
  };

  config = lib.mkIf cfg.enable { };
}
