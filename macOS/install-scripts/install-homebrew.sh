#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew

echo "installs homebrew: see https://brew.sh/index_de for more information"

set -e 
set -x

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
