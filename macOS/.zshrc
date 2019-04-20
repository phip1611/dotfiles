# Path to your oh-my-zsh installation.
export ZSH="/Users/phip1611/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(
  git
  yarn
  npm
  ng   
  colored-man-pages 
  httpie
  mvn
  urltools
  colorize

  #  brew  laut hinweis nicht länger benötigt; automatisch da oder so
)

source $ZSH/oh-my-zsh.sh

# User specific stuff

# JSON
alias parse_json='python -m json.tool | pygmentize -l JSON'
alias colorize_json='pygmentize -l JSON'

#pdfgrep:
#  i: ignore case
#  H: include file name
#  n: page number
#  C -0: nur Zeile mit vorkommen ausgeben
alias pdfgrepx='pdfgrep -iHn -C 0'

# GPG
# für signed commits in git
export GPG_TTY=$(tty)

# username@machine im "agnoster" theme entfernen
DEFAULT_USER=phip1611

export HOMEBREW_EDITOR=micro

# GNU BIN UTILS
# falls ich die mal brauchen sollte
#export PATH="/usr/local/opt/binutils/bin:$PATH"

# IMAGE
# zum Anzeigen der EXIF Infos: es muss der Dateiname folgen (imagemagick muss installiert sein)
alias readexif='identify -format "%[EXIF:*]"'
