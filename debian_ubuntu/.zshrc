source ~/dotfiles/common/.common-zsh-plugins
source ~/dotfiles/common/.common-sh-alias
source ~/dotfiles/common/.common-zshrc

# add plugins only useful on ubuntu/debian
plugins=(
  
) # extend common plugins
plugins+=("${common_zsh_plugins[@]}")

# Register Plugins and Theme @ Oh My ZSH
source $ZSH/oh-my-zsh.sh
