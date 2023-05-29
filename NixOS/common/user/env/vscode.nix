username:

{ lib, config, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf (cfg.enable && !cfg.excludeGui) {
    home-manager.users."${username}" = { pkgs, ... }: {
      programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          rust-lang.rust-analyzer
          editorconfig.editorconfig
        ];
      };
    };
  };
}
