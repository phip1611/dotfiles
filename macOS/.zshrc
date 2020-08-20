source ~/dotfiles/common/.common-zsh-plugins
source ~/dotfiles/common/.common-alias
source ~/dotfiles/common/.common-env
source ~/dotfiles/common/.common-zshrc

# add plugins only useful on ubuntu/debian
plugins=(
  osx
) # extend common plugins
plugins+=("${common_zsh_plugins[@]}")

# GPG
# für signed commits in git
export GPG_TTY=$(tty)

export HOMEBREW_EDITOR=micro

# GNU BIN UTILS
# falls ich die mal brauchen sollte
#export PATH="/usr/local/opt/binutils/bin:$PATH"

# cargo, rust, rustup (not installed with brew)
export PATH="$HOME/.cargo/bin:$PATH"

# since adopt open jdk is used the var is not automatically set
JAVA_HOME=$(/usr/libexec/java_home)
