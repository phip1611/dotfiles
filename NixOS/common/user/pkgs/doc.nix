{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.doc;
  username = builtins.head config.phip1611.usernames;
in
{
  options = {
    phip1611.common.user.pkgs.doc.enable = lib.mkEnableOption "Enable doc packages (man pages ,...)";
  };

  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      man-pages # enables for example to type "$ man 2 open"
      man-pages-posix
    ];
  };
}
