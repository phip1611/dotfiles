# This module enables typical environment settings (liek default shell) and
# home manager for the given user. This is a big "all-in-one" module with no
# further sub-enable-options.

{ pkgs, lib, config, options, ... }:

let
  homeManager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/refs/heads/release-22.11.tar.gz";
  username = config.phip1611.common.cfg.username;
  stateVersion = config.phip1611.common.cfg.stateVersion;
  cfg = config.phip1611.common.user.env;
in
{
  imports = [
    # Enables the "home-manager" configuration property. This also works
    # for users of this module, i.e., on the very top level.
    (import "${homeManager}/nixos")
    (import ./alacritty.nix username)
    (import ./git.nix username)
    (import ./tmux.nix username)
    (import ./vscode.nix username)
    (import ./zsh.nix username)
  ];

  options = {
    phip1611.common.user.env = {
      enable = lib.mkEnableOption "Enable all user-environmental options (shell, homemanager, dotfiles, ...)";
    };
  };

  # Set zsh as default shell and
  config = lib.mkIf cfg.enable {
    home-manager.users."${username}" = { pkgs, config, ... }: {
      home.stateVersion = stateVersion;
      nixpkgs.config.allowUnfree = true;
      home.shellAliases = {
        exa = "exa -lFagh --time-style=long-iso";
      };

      # Link the location of the "cargo" proxy binary of rustup from nixpkgs
      home.file.".cargo/bin".source = config.lib.file.mkOutOfStoreSymlink /etc/profiles/per-user/pschuster/bin;
    };

    users.users."${username}" = {
      shell = pkgs.zsh;
    };
  };
}
