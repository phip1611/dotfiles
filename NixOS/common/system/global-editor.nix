{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.system.global-editor;
in
{
  options = {
    phip1611.common.system.global-editor.enable = lib.mkEnableOption "Enable micro as global editor";
  };

  config = lib.mkIf cfg.enable {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      micro
    ];

    # Probably unused, but ensure that never a program uses vi or so.
    environment.variables.EDITOR = "micro";
    environment.variables.VISUAL = "micro";
  };
}
