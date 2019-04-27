# see "oh my zsh" on google for more details and help!
export ZSH=/home/phip1611/.oh-my-zsh

# username@machine im "agnoster" theme entfernen
DEFAULT_USER=phip1611
ZSH_THEME="agnoster"

source ~/dotfiles/common/.common-zsh-plugins
plugins=(
  # TODO add plugins
  
) # alle extrahieren und anhängen
plugins+=("${common_zsh_plugins[@]}")

source $ZSH/oh-my-zsh.sh

##########################
source ~/dotfiles/common/.common-alias
# User specific stuff (alias and stuff)



