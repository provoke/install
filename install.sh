#!/bin/bash

#download
curl -L -o latest.tar.gz https://github.com/provoke/tools/tarball/master
mkdir tools-latest
tar -xvf latest.tar.gz --strip-components=1 -C tools-latest

#place
mkdir -p .local/bin
mv tools-latest/* .local/bin/.

#tmux
rm .tmux.conf
mv .local/bin/tmux.conf .tmux.conf

#cleanup
rm -rf tools-latest latest.tar.gz

isInFile=$(cat .bashrc | grep -c "source ~/.local/bin/aliases")
echo $isInFile

if [ $isInFile -eq 0 ] 
then 
  echo 'aliases not installed'
  echo "source ~/.local/bin/aliases" >> .bashrc
  echo 'aliases now installed'
else 
  echo 'aliases already installed' 
fi
  
source ~/.bashrc

