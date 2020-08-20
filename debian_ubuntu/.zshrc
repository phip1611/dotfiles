source ~/dotfiles/common/.common-zsh-plugins
source ~/dotfiles/common/.common-alias
source ~/dotfiles/common/.common-env
source ~/dotfiles/common/.common-zshrc

plugins=(
  osx
) # alle extrahieren und anhängen
plugins+=("${common_zsh_plugins[@]}")

# Register Plugins and Theme @ Oh My ZSH
source $ZSH/oh-my-zsh.sh
