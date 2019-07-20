# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"

# username@machine im "agnoster" theme entfernen
DEFAULT_USER=$(whoami)
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

source ~/dotfiles/common/.common-zsh-plugins
plugins=(
  # TODO add plugins
  osx  
) # alle extrahieren und anhängen
plugins+=("${common_zsh_plugins[@]}")

# Register Plugins and Theme @ Oh My ZSH
source $ZSH/oh-my-zsh.sh

##########################
source ~/dotfiles/common/.common-alias
# User specific stuff (alias and stuff)

# GPG
# für signed commits in git
export GPG_TTY=$(tty)

export HOMEBREW_EDITOR=micro

# GNU BIN UTILS
# falls ich die mal brauchen sollte
#export PATH="/usr/local/opt/binutils/bin:$PATH"

# cargo, rust, rustup (not installed with brew)
export PATH="$HOME/.cargo/bin:$PATH"
