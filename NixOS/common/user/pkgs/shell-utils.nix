# Shell-related utilities.

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.shell-utils;
  username = config.phip1611.common.cfg.username;

  nixpkgsUnstableSrc = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/148dae7b4c90fe0f1c286a43534e8de87b5f4eb9.tar.gz";
    sha256 = "sha256:1brhgqz61sqqhlcszs1kaa9nmfp1sym50y5pfffbjiriszwc7czc";
  };

  nixpkgsUnstable = import nixpkgsUnstableSrc { };

  # All packages that are not yet in nixpkgs stable that I need.
  pkgsUnstable = with nixpkgsUnstable; [
    ansi
    ttfb
  ];
in
{
  options = {
    phip1611.common.user.pkgs.shell-utils.enable = lib.mkEnableOption "Enable my typical GUI apps and fonts";
  };

  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      # +++ CLI Tools +++
      # ansi
      bat
      bottom
      # already there automatically; here only for completeness
      coreutils
      curl
      du-dust
      exa
      file
      git
      httpie
      killall
      micro
      nixpkgs-fmt
      ripgrep
      tcpdump
      tldr
      tmux
      tree
      # ttfb
      util-linux # lsblk and more
      wget
      vim
      xclip # for copy&paste in several tools, such as micro
      zsh
      zx
    ] ++ pkgsUnstable;
  };
}
