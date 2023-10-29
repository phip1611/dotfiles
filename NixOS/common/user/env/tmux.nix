username:

{ pkgs, lib, config, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf cfg.enable {
    home-manager.users."${username}" = {
      programs.tmux.enable = true;
      programs.tmux.extraConfig = builtins.readFile ./tmux.cfg;
    };
  };
}
