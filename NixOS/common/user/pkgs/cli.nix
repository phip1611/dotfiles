# Shell-related utilities.

{ pkgs, lib, config, options, nixpkgs-unstable, ... }:

let
  cfg = config.phip1611.common.user.pkgs.cli;
  username = config.phip1611.username;
  pkgs-unstable = nixpkgs-unstable.legacyPackages."x86_64-linux";
in
{
  options = {
    phip1611.common.user.pkgs.cli.enable = lib.mkEnableOption "Enable my typical CLI tools";
  };

  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
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
      ookla-speedtest # needs unfree nixpkgs
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
      usbutils # lsusb
      util-linux # lsblk and more
      wget
      whois
      vim
      xclip # for copy & paste in several tools, such as micro
      zsh
      zx
    ]
    ++
    # All packages that are not yet in nixpkgs stable that I need.
    (with pkgs-unstable; [
      ansi
      nflz
      paging-calculator
      ttfb
      wambo
      yamlfmt
    ]);
  };
}
