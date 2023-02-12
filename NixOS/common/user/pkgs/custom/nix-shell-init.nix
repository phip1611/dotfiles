{ pkgs }:

let
  template = ''
    { pkgs ? import <nixpkgs> {} }:
      pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          # add pkgs, such as gcc or openssl
        ];
    }
  '';
in
pkgs.writeShellScriptBin "nix-shell-init" ''
  echo -n "${template}" > $PWD/shell.nix
''
