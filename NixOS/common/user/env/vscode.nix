username:

{ pkgs, lib, config, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf (cfg.enable && !cfg.excludeGui) {
    home-manager.users."${username}" = {
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
  };
}
