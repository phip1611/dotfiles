echo "executes all install scripts in proper order; execute this on init of system/machine"
zsh 'install-common-apt-packages.zsh'
sh 'install-rustup.sh'
sh 'install-micro-manually.sh'
sh 'install-common-cargo-packages.sh'
