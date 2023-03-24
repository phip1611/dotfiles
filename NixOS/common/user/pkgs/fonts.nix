# Fonts

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.pkgs.fonts;
in
{
  options = {
    phip1611.common.user.pkgs.fonts.enable = lib.mkEnableOption "Enable my typical fonts (source code pro, ,...)";
  };

  config = lib.mkIf cfg.enable {
    # https://nixos.wiki/wiki/Fonts
    fonts = {
      fonts = with pkgs; [
        open-sans
        roboto
        roboto-mono
        # For example used by allacritty's config.
        source-code-pro
      ];

      # Required by some X11 apps
      fontDir.enable = true;
    };
  };
}
