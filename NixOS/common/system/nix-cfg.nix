{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.system.nix-cfg;
  username = config.phip1611.common.cfg.username;
in
{
  options = {
    phip1611.common.system.nix-cfg.enable = lib.mkEnableOption "Enable Nix-related configurations";
  };

  config = lib.mkIf cfg.enable {
    nix = {
      settings = {
        # tips from: https://jackson.dev/post/nix-reasonable-defaults/
        connect-timeout = 5;
        log-lines = 25;
        min-free = 128000000;
        max-free = 1000000000;
        experimental-features = "nix-command flakes";
        fallback = true;
        warn-dirty = false;
        # nix optimise the store after each and every build (for the built path)
        # by replacing identical files in the store by hard links.
        auto-optimise-store = true;
        keep-outputs = true;

        trusted-users = [ username ];
      };

      # Garbage Collection
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      # Scheduled systemd service that optimizes all paths in the nix store
      # by replacing identical files in the store by hard links.
      optimise = {
        automatic = true;
      };
    };
  };
}
