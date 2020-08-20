echo "this installs exa (https://github.com/ogham/exa) (modern ls replacement)"
cd /tmp
git clone https://github.com/ogham/exa.git
cd exa
make install
# file will be placed in /usr/local/bin
