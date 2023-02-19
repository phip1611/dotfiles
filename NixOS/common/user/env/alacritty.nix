username:

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf cfg.enable {
    home-manager.users."${username}" = { pkgs, config, ... }: {
      programs.alacritty = {
        enable = true;
        settings = builtins.fromJSON (builtins.readFile ./alacritty.json);
      };
    };
  };
}
