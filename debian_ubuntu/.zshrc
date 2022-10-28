source ~/dotfiles/common/.common-zsh-plugins
# this doesn't work because e.g. 'ls' it is overwritten by
# zsh aliases itself
# source ~/dotfiles/common/.common-sh-alias
source ~/dotfiles/common/.common-zshrc

# add plugins only useful on ubuntu/debian
plugins=(
 
) # extend common plugins
plugins+=("${common_zsh_plugins[@]}")
# Register Plugins and Theme @ Oh My ZSH + general oh my zsh init
source $ZSH/oh-my-zsh.sh

# aliases after ZSHs aliases are set:
source ~/dotfiles/common/.common-sh-alias

# similar to "open" on MacOS
alias open=xdg-open

