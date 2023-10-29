{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.media;
  username = builtins.head config.phip1611.usernames;
in
{
  options = {
    phip1611.common.user.pkgs.media.enable = lib.mkEnableOption "Enable media packages (ffmpeg, imagemagick ,...)";
  };

  config = lib.mkIf cfg.enable {
    users.users."${username}".packages = with pkgs; [
      ffmpeg
      imagemagick
      libwebp # webp encoder
    ];
  };
}
