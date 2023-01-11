#!/bin/bash

curl -L -o latest.zip https://github.com/provoke/tools/archive/refs/tags/latest.zip
unzip latest.zip
mkdir -p .local/bin
mv tools-latest/* .local/bin/.
rm -rf tools-latest latest.zip

if grep -R "source ~/.local/bin/aliasess" ".bashrc"
then 
  echo 'aliases already installed' 
else 
  echo 'aliases not installed'
  echo "source ~/.local/bin/aliases" >> .bashrc
  echo 'aliases now installed'
fi
  

