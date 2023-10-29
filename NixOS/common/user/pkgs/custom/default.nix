{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.custom;
  username = builtins.head config.phip1611.usernames;
in
{
  imports = [
  ];

  options = {
    phip1611.common.user.pkgs.custom.enable = lib.mkEnableOption "Enable custom pkgs (convenient shell scripts, not in nixpkgs)";
  };

  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      (pkgs.callPackage ./nix-shell-init.nix { })
      (pkgs.callPackage ./qemu-uefi.nix { })
    ];
  };
}
