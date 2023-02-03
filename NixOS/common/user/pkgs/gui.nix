# GUI/Desktop Apps

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.gui;
  username = config.phip1611.common.cfg.username;
in
{
  options = {
    phip1611.common.user.pkgs.gui.enable = lib.mkEnableOption "Enable shell tools (exa, ,...)";
  };

  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      alacritty
      jetbrains.clion
      gimp
      google-chrome
      gparted
      signal-desktop
      spotify
      vscode
    ];
  };
}
