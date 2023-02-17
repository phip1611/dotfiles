# Development-related dependencies.

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.dev;
  username = config.phip1611.common.cfg.username;
in
{
  options = {
    phip1611.common.user.pkgs.dev.enable = lib.mkEnableOption "Enable development-related pkgs (gcc, rustup, ...)";
  };

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
      # Experience shows that this is not working in all cases as intended. Instead,
      # projects should open a nix-shell like this: `$ nix-shell -p openssl pkg-config`
      # pkg-config
      qemu
    ];
  };
}
