echo "installs micro manually and not via package manager"

sudo apt remove micro

curl https://getmic.ro | bash
sudo mv micro /usr/local/bin
