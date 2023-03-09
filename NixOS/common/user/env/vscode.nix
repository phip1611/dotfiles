username:

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf cfg.enable {
    home-manager.users."${username}" = { pkgs, config, ... }: {
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