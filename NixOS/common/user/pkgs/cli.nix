# Shell-related utilities.

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.cli;
  username = config.phip1611.username;

  nixpkgsUnstableSrc = builtins.fetchTarball {
    # Picked a recent commit from the "master" branch, i.e., Nix unstable:
    # https://github.com/NixOS/nixpkgs/commits/master
    url = "https://github.com/NixOS/nixpkgs/archive/5b7af1a4176cf0810069ac034a8f18ba685d1aa0.tar.gz";
    sha256 = "sha256:0g8sz2hkx2csk5q3f73fzwdbqdjwwwy1ph6w0mvvadipi5i660kj";
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
      calc
      cmatrix
      cowsay
      # already there automatically; here only for completeness
      coreutils
      curl
      dig # dig and nslookup
      du-dust
      exa
      fd # better find
      file
      fortune
      git
      iperf3
      jq # pretty-print JSON
      htop
      httpie
      killall
      less
      lolcat
      magic-wormhole # e2e encrypted file transfer "wormhole"
      micro
      nixos-option
      nixpkgs-fmt
      ouch # cool convenient (de)compression tool
      pciutils # lspci
      ripgrep
      tcpdump
      tldr
      tmux
      tokei
      traceroute
      tree
      ## ttfb
      typos
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
