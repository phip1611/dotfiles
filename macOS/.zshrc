source ~/dotfiles/common/.common-zsh-plugins
# this doesn't work because e.g. 'ls' it is overwritten by
# zsh aliases itself
# source ~/dotfiles/common/.common-sh-alias
source ~/dotfiles/common/.common-zshrc

# add plugins only useful on ubuntu/debian
plugins=(
  macos
) # extend common plugins
plugins+=("${common_zsh_plugins[@]}")
# Register Plugins and Theme @ Oh My ZSH + general oh my zsh init
source $ZSH/oh-my-zsh.sh

# aliases after ZSHs aliases is set:
source ~/dotfiles/common/.common-sh-alias


# GPG
# für signed commits in git
export GPG_TTY=$(tty)

export HOMEBREW_EDITOR=micro

# GNU BIN UTILS
# falls ich die mal brauchen sollte
#export PATH="/usr/local/opt/binutils/bin:$PATH"

# Gnu Core Utils (like ls)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# GNU find utils (like find)
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

# cargo, rust, rustup (not installed with brew)
export PATH="$HOME/.cargo/bin:$PATH"

# use openjdk@11 installed by brew cask first in path
JAVA_HOME=/usr/local/opt/openjdk@11
export PATH="$JAVA_HOME/bin:$PATH"

# The homebrew package "zplug" stores the package files here.
export ZPLUG_RES=/usr/local/opt/zplug
source ~/dotfiles/common/.common-zplug
