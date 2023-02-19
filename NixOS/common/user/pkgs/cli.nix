# Shell-related utilities.

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.cli;
  username = config.phip1611.common.cfg.username;

  nixpkgsUnstableSrc = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/2fe7e66ca091f5d3e7cef55ac4d8354ac13c5062.tar.gz";
    sha256 = "sha256:11nn5fps22v45piq10hq4hmwhg717c30p7cp7k6cqb1c0vks8f1l";
  };

  nixpkgsUnstable = import nixpkgsUnstableSrc { };

  # All packages that are not yet in nixpkgs stable that I need.
  pkgsUnstable = with nixpkgsUnstable; [
    ansi
    nflz
    paging-calculator
    ttfb
    wambo
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
      fd # better find
      file
      git
      iperf3
      htop
      httpie
      killall
      less
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
      xclip # for copy & paste in several tools, such as micro
      zsh
      zx
    ] ++ pkgsUnstable;
  };
}
