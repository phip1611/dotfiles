let
  nixpkgs =
    # Picked a recent commit from the "nixos-22.11-small"-branch.
    # If you change this, also alter the sha256 hash manually!
    let rev = "91111087ba0e0af9dcd76d754e5ef5ac59dd2b05";
    in
    builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
      sha256 = "sha256:07yllqlfq1wrnk2jsy9jgfd816hgif5k9bvf7fwslxyya62sm60d";
    };
  pkgs = import nixpkgs { };
  config = pkgs.nixos [ ./configuration.nix ];
in
config.config.system.build.toplevel
