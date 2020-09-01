source ~/dotfiles/common/.common-zsh-plugins
# this doesn't work because e.g. 'ls' it is overwritten by
# zsh aliases itself
# source ~/dotfiles/common/.common-sh-alias
source ~/dotfiles/common/.common-zshrc

# add plugins only useful on ubuntu/debian
plugins=(
  osx
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

# cargo, rust, rustup (not installed with brew)
export PATH="$HOME/.cargo/bin:$PATH"

# since adopt open jdk is used the var is not automatically set
JAVA_HOME=$(/usr/libexec/java_home)
