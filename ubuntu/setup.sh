cd ~

apt update
apt upgrade -y
apt install -y zsh tree curl git vim build-essential valgrind

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

