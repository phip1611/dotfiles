echo "this installs exa (https://github.com/ogham/exa) (modern ls replacement)"
cd /tmp
git clone https://github.com/ogham/exa.git
cd exa
#sudo make install  doesn't work because cargo is only installed for the user
cargo build --release
sudo make install-man
sudo cp target/release/exa /usr/local/bin
# file will be placed in /usr/local/bin
