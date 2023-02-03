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
      element-desktop
      jetbrains.clion
      gimp
      google-chrome
      # Nextcloud sets up a background service automatically.
      nextcloud-client
      signal-desktop
      spotify
      vscode
    ];
  };
}
