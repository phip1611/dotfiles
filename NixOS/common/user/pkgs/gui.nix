# GUI/Desktop Apps

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.user.pkgs.gui;
  username = config.phip1611.cfg.username;
in
{
  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      # +++ Fonts +++
      source-code-pro

      # GUI Apps
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

      # +++ GNOME Extensions +++
      gnome.gnome-tweaks
      # This is only a subset of extensions but dash-to-dock
      # is the most important one. However, without further
      # configuration, it doesn't look what I want it to look like.
      gnomeExtensions.dash-to-dock
      gnomeExtensions.places-status-indicator
      gnomeExtensions.emoji-selector
    ];
  };
}
