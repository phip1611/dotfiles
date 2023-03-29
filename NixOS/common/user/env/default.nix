# This module enables typical environment settings (like default shell, prompt)
# and home manager for the given user. This is intented as a big "all-in-one"
# module with no further sub-enable-options.

{ pkgs, lib, config, options, ... }:

let
  homeManager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/refs/heads/release-22.11.tar.gz";
  username = config.phip1611.username;
  stateVersion = config.phip1611.stateVersion;
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
      # Useful as those options are not needed in CLI-only environments. Most/
      # all of those settings will bring them into the path and occupy storage.
      excludeGui = lib.mkEnableOption "Disable configurations for GUI-based utilities (alacritty, vs code, ...)";
    };
  };

  # Set some aliases and environment variables, plus other misc stuff.
  config = lib.mkIf cfg.enable {
    home-manager.users."${username}" = { pkgs, config, ... }: {
      home.stateVersion = stateVersion;
      nixpkgs.config.allowUnfree = true;
      home.shellAliases = {
        exa = "exa -lFagh --time-style=long-iso";
      };

      # With zsh, the global option "environment.variables.*" is not taken into
      # account. (This is a bug, I guess). Hence, I use it here.
      #
      # I never came accross a case where this was needed, however, better be
      # safe so that I can always use micro in my CLI utilities.
      home.sessionVariables = {
        EDITOR = "${pkgs.micro}/bin/micro";
        VISUAL = "${pkgs.micro}/bin/micro";
      };

      # Link the location of the "cargo" proxy binary of rustup from nixpkgs
      home.file.".cargo/bin".source = config.lib.file.mkOutOfStoreSymlink "/etc/profiles/per-user/${username}/bin";
    };
  };
}
