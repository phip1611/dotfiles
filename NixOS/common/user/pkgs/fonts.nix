# GUI/Desktop Apps

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.fonts;
  username = config.phip1611.common.cfg.username;
in
{
  options = {
    phip1611.common.user.pkgs.fonts.enable = lib.mkEnableOption "Enable my fonts (source-code-pro, ,...)";
  };

  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      open-sans
      roboto
      roboto-mono
      source-code-pro
    ];
  };
}
