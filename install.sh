#!/bin/bash

vim --version || (apt-get update && apt-get install -y vim)
cp vimrc /etc/vim/vimrc
echo "Configure VIM for root user"
vim +PluginInstall +qall

ls /home | while read username; do
  echo "Configure VIM for $username user"
  su - $username -c 'vim +PluginInstall +qall'
done
