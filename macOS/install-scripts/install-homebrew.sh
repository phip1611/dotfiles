#!/bin/zsh

echo "installs homebrew: see https://brew.sh/index_de for more information"

set -e 
set -x

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
