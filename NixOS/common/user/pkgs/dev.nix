# Development-related dependencies.

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.user.pkgs.dev;
  username = config.phip1611.cfg.username;
in
{
  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      # +++ Cargo utils +++
      cargo-expand
      cargo-license
      cargo-msrv
      cargo-outdated
      cargo-update
      cargo-watch

      # +++ dev tools+++
      gcc
      # already there automatically; here only for completeness
      binutils
      clang-tools # clang-format
      cmake
      gdb
      gnumake
      ninja
      nodejs
      # Rustup can't auto-update itself but installed Rust
      # toolchains.
      rustup
      # Experience showed that this is not working in all cases as intended. Instead,
      # projects should open a nix-shell like this: `$ nix-shell -p openssl pkg-config`
      # pkg-config
      qemu
    ];
  };
}
