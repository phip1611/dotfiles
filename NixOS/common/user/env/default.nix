# This module enables typical environment settings (like default shell, prompt)
# and home manager for the given user. This is intented as a big "all-in-one"
# module with no further sub-enable-options.

{ lib, config, options, ... }:

let
  username = config.phip1611.username;
  stateVersion = config.system.stateVersion;
  cfg = config.phip1611.common.user.env;
in
{
  imports = [
    (import ./alacritty.nix username)
    (import ./cargo.nix username)
    (import ./direnv.nix username)
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
    };
  };
}
