{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.system.nix-cfg;
  username = config.phip1611.common.cfg.username;
in
{
  options = {
    phip1611.common.system.nix-cfg.enable = lib.mkEnableOption "Enable basic sensible nix configurations defaults";
  };

  config = lib.mkIf cfg.enable {
    nix.settings = {
      # tips from: https://jackson.dev/post/nix-reasonable-defaults/
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000;
      max-free = 1000000000;
      experimental-features = "nix-command flakes";
      fallback = true;
      warn-dirty = false;
      auto-optimise-store = true;
      keep-outputs = true;

      trusted-users = [ username ];
    };
  };
}
