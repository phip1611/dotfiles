# Sets the configuration for allacritty.

{ pkgs, lib, config, ... }:

let
  usernames = config.phip1611.usernames;
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf (cfg.enable && !cfg.excludeGui) {

    fonts.fonts = with pkgs; [
      source-code-pro
    ];

    home-manager.users = builtins.foldl'
      (acc: next: {
        "${next}" = {
          programs.alacritty = {
            enable = true;
            settings = builtins.fromJSON (builtins.readFile ./alacritty.json);
          };
        };
      } // acc)
      { }
      usernames;
  };
}
