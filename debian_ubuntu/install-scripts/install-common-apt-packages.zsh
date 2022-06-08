#!/usr/bin/zsh

echo "Installs Common Utils I use on debian/ubuntu systems"
echo "Installs only non-rust binaries. These are installed via cargo"

# install packages one by one because otherwise the whole command fails if
# a single package is not available
# https://superuser.com/questions/837662/continue-on-error-when-apt-get-encounters-an-install-unable-to-locate-package-is
PACKAGES=(
  build-essential
  calc
  cmake
  curl
  git
  htop
  httpie
  'net-tools'
  'python3-pygments'
  'python3-pip'
  ripgrep
  tldr
  tree
  valgrind
  xclip
  vim

  # Required by some Rust binaries, like cargo-outdate
  # but also many other tools, when they get build.
  libftdi1-dev
  libssl-dev
  libusb-1.0-0-dev
  pkg-config
  openssl

  # Required to compile Linux (5.13 +)
  bison
  flex
  dwarves
  libncurses-dev
  libelf-dev
  zstd 
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
