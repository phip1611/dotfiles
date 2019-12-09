# see "oh my zsh" on google for more details and help!
user=$(whoami)
export ZSH=/home/${user}/.oh-my-zsh

# username@machine im "agnoster" theme entfernen
DEFAULT_USER=${user}
ZSH_THEME="agnoster"

source ~/dotfiles/common/.common-zsh-plugins
plugins=(
  docker
  docker-compose
) # alle extrahieren und anhängen
plugins+=("${common_zsh_plugins[@]}")

source $ZSH/oh-my-zsh.sh

##########################
source ~/dotfiles/common/.common-alias
# User specific stuff (alias and stuff)
source ~/.zshrc-ms # ms: Machine specific
