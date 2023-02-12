# Shell-related utilities.

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.cli;
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
    phip1611.common.user.pkgs.cli.enable = lib.mkEnableOption "Enable my typical CLIs";
  };

  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      # +++ CLI Tools +++
      ## ansi
      bat
      bottom
      # already there automatically; here only for completeness
      coreutils
      curl
      dig # dig and nslookup
      du-dust
      exa
      file
      git
      iperf3
      htop
      httpie
      killall
      micro
      nixos-option
      nixpkgs-fmt
      ripgrep
      tcpdump
      tldr
      tmux
      tokei
      traceroute
      tree
      ## ttfb
      util-linux # lsblk and more
      wget
      whois
      vim
      xclip # for copy&paste in several tools, such as micro
      zsh
      zx
    ] ++ pkgsUnstable;
  };
}
