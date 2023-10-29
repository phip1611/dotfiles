{ pkgs, lib, config, ... }:

let
  usernames = config.phip1611.usernames;
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf (cfg.enable && !cfg.excludeGui) {
    home-manager.users = builtins.foldl'
      (acc: next: {
        "${next}" = {
          programs.vscode = {
            enable = true;
            extensions = with pkgs.vscode-extensions; [
              bbenoist.nix
              tamasfe.even-better-toml
              editorconfig.editorconfig
              rust-lang.rust-analyzer
            ];
          };
        };
      } // acc)
      { }
      usernames;
  };
}
