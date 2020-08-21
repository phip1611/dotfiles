echo "Installs Common Utils I use on debian/ubuntu systems"

sudo apt update
# python3 pygments is for oh-my-zsh plugin "colorize" 
# note that bat may be installed as "batcat" (https://github.com/sharkdp/bat)
sudo apt install git build-essential curl micro bat cmake httpie vim tree python3-pygments python3-pip xclip net-tools ripgrep
