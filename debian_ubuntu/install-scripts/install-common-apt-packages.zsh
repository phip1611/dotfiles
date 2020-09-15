#!/usr/bin/zsh

echo "Installs Common Utils I use on debian/ubuntu systems"

# install packages one by one because otherwise the whole command fails if
# a single package (like micro, bat) is not available
# https://superuser.com/questions/837662/continue-on-error-when-apt-get-encounters-an-install-unable-to-locate-package-is
PACKAGES=(
  git
  build-essential
  curl
  micro
  bat
  cmake
  httpie
  vim
  tree 
  'python3-pygments'
  'python3-pip'
  xclip
  'net-tools'
  ripgrep
  htop
  tldr
)


sudo apt update
for i in "${PACKAGES[@]}"
do
    echo "##################################" 
    echo "## INSTALLING PACKAGE: $i"
    echo 
    sudo apt install $i -y
done

# python3 pygments is for oh-my-zsh plugin "colorize" 
# note that bat may be installed as "batcat" (https://github.com/sharkdp/bat)
