#!/bin/bash

curl -L -o latest.tar.gz https://github.com/provoke/tools/archive/refs/tags/latest.tar.gz
tar -xvf latest.tar.gz
mkdir -p .local/bin
mv tools-latest/* .local/bin/.
mv .local/bin/tmux.conf .tmux.conf
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

