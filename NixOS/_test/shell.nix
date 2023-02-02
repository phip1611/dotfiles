let
  # Picked a recent commit from the "nixos-22.11-small"-branch.
  ref = "91111087ba0e0af9dcd76d754e5ef5ac59dd2b05";
  nixpkgsSrc = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${ref}.tar.gz";
    sha256 = "sha256:07yllqlfq1wrnk2jsy9jgfd816hgif5k9bvf7fwslxyya62sm60d";
  };
  pkgs = import nixpkgsSrc { };
  nixosCfg = "${builtins.getEnv "PWD"}/configuration.nix";
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    cacert
    nixos-rebuild
  ];

  shellHook = ''
    export NIX_PATH=nixos-config=${nixosCfg}:nixpkgs=${nixpkgsSrc}
  '';
}
