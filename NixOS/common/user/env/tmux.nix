{ pkgs, lib, config, ... }:

let
  usernames = config.phip1611.usernames;
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf cfg.enable {
    home-manager.users = builtins.foldl'
      (acc: next: {
        "${next}" = {
          programs.tmux.enable = true;
          programs.tmux.extraConfig = builtins.readFile ./tmux.cfg;
        };
      } // acc)
      { }
      usernames;
  };
}
