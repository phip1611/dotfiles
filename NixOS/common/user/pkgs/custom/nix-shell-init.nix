{ pkgs }:

let
  template = ''
    { pkgs ? import <nixpkgs> { } }:
    pkgs.mkShell rec {
      # CLI Utilities
      nativeBuildInputs = with pkgs; [
        # pkg-config
      ];

      # Header Files, Runtime Dependencies
      # buildInputs = with pkgs; [
        # openssl
        # xorg.libX11
      # ];

      # Enable to find shared objects, such as libX11.so.
      # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath buildInputs}";
    }
  '';
in
pkgs.writeShellScriptBin "nix-shell-init" ''
  echo -n "${template}" > $PWD/shell.nix
''
