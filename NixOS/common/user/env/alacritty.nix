# Sets the configuration for allacritty.

username:

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf (cfg.enable && !cfg.excludeGui) {

    fonts.fonts = with pkgs; [
      source-code-pro
    ];

    home-manager.users."${username}" = { pkgs, config, ... }: {
      programs.alacritty = {
        enable = true;
        settings = builtins.fromJSON (builtins.readFile ./alacritty.json);
      };
    };
  };
}
