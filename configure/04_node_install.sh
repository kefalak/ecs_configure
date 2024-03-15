#!/bin/bash
sudo apt install wget
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.39.0/install.sh | bash
source ~/.profile
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;
nvm install --lts
