username:

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf cfg.enable {
    home-manager.users."${username}" = { pkgs, config, ... }: {
      home.packages = [ pkgs.oh-my-zsh ];
      programs.zsh = {
        enable = true;

        oh-my-zsh = {
          enable = true;
          theme = "agnoster";
          plugins = [
            "colored-man-pages"
            "docker"
            "docker-compose"
            "httpie"
            "git"
            "mvn"
            "ng"
            "ripgrep"
            "urltools"
          ];
        };

        # With zplug, I manage external plugins that are not part of the
        # oh-my-zsh framework. They are installed automatically.
        zplug = {
          enable = true;
          plugins = [
            { name = "zsh-users/zsh-autosuggestions"; }
            { name = "zsh-users/zsh-syntax-highlighting"; }
            # use zsh in nix-shell
            { name = "chisui/zsh-nix-shell"; }
            # completions for nix attributes
            { name = "spwhitt/nix-zsh-completions"; }
          ];
        };
      };
    };
  };
}