cd ~

apt update
apt upgrade -y
apt install -y zsh tree curl git vim build-essential valgrind

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl https://getmic.ro | bash
mv micro /usr/local/bin

git config --global user.email "phip1611@gmail.com"
git config --global user.name "Philipp Schuster"
git config --global core.editor micro
git config --global pull.rebase true
