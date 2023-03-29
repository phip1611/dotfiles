username:

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.env;
in
{
  config = lib.mkIf cfg.enable {

    # ZSH as default shell for my user.
    users.users."${username}" = {
      shell = pkgs.zsh;
    };

    # Add an entry to /etc/shells. I didn't encounter a situation yet where this
    # was actually required, but it is recommended in the docs.
    environment.shells = with pkgs; [ zsh ];

    home-manager.users."${username}" = { pkgs, config, ... }: {
      home.sessionVariables = {
        # Hide "user@host" in ZSH's agnoster-theme => shorter prompt
        DEFAULT_USER = username;
      };

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
