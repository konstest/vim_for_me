#!/bin/bash

vim --version || (apt-get update && apt-get install -y vim)
cp vimrc /etc/vim/vimrc
ls /home | while read username; do
  echo "Configure VIM for $username user"
  cp -r vim /home/$username/.vim
  chown -R $username /home/$username/.vim
#  su $username -c 'vim +PluginInstall +qall'
done
