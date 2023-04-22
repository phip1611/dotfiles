# GUI/Desktop Apps

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.gui;
  username = config.phip1611.username;
in
{
  options = {
    phip1611.common.user.pkgs.gui.enable = lib.mkEnableOption "Enable shell tools (exa, ,...)";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    # Teamviewer GUI doesn't work without the daemon.
    services.teamviewer.enable = true;

    users.users."${username}".packages = with pkgs; [
      alacritty
      firefox
      jetbrains.clion
      gimp
      google-chrome
      gparted
      signal-desktop
      spotify
      teamviewer
      tdesktop # telegram desktop
      vscode
      xournalpp
    ];
  };
}
