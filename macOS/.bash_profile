# Bash-RC wird bei MacOS nicht standardmäßig ausgeführt
source ~/.bashrc

# Aliase
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%Y-%m-%d"'

# in bash shell geht: ifconfig | grep 192.168.* | awk '/inet /{print substr($2,0)}'
# als alias aber nicht. Mal jemanden fragen!
#alias localip='ifconfig | grep 192.168.* | awk "/inet /{print substr($2,0)}"'

#json formatting (pipe(
alias json='python -m json.tool'

#useful params for common commands
alias ls='ls -G'
alias lsx='ls -alSh'
alias lsxr='ls -alShR'
#pdfgrep:
#  i: ignore case
#  H: include file name
#  n: page number
#  C -0: nur Zeile mit vorkommen ausgeben
alias pdfgrepx='pdfgrep -iHn -C 0'


# Git Autovervollständigung (für's tabben)
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Hilfsfunktion um dem Branchnamen in der Prompt anzuzeigen
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt:
#   normal:   17:45:13 @phip1611$~/a/b: 
#   git-repo: 17:45:13 @phip1611$~/a/a-repo/ (git-branch): 
export PS1="\[\e[37m\]\t\[\e[m\]\[\e[32m\] \[\e[m\]\[\e[32m\]\\$\[\e[m\]\[\e[32m\]\w\[\e[m\]\[\e[32m\]\[\e[33m\]\$(parse_git_branch)\[\e[m\]:\[\e[m\] "

# damit gpg funktioniert
# brauche ich für signed commits in git
export GPG_TTY=$(tty)

# npm shell completion
. ~/.npm-completion.bash
