echo "installs bat (batcat) manually and not via package manager"

sudo apt remove bat

cd /tmp
git clone https://github.com/sharkdp/bat.git
cd bat

cargo build --release
sudo mv target/release/bat /usr/local/bin
