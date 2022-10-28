source ~/dotfiles/common/.common-zsh-plugins
# this doesn't work because e.g. 'ls' it is overwritten by
# zsh aliases itself
# source ~/dotfiles/common/.common-sh-alias
source ~/dotfiles/common/.common-zshrc

# add plugins only useful on ubuntu/debian
plugins=(

) # extend common plugins
plugins+=("${common_zsh_plugins[@]}")
# Register Plugins and Theme @ oh-my-zsh + general oh-my-zsh init
source $ZSH/oh-my-zsh.sh

# aliases AFTER oh-my-zsh aliases are set:
source ~/dotfiles/common/.common-sh-alias

# similar to "open" on MacOS
alias open=xdg-open

# The debian package "zplug" stores the package files here.
export ZPLUG_RES=/usr/share/zplug
source ~/dotfiles/common/.common-zplug
