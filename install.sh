#!/bin/bash

curl -L -o latest.zip https://github.com/provoke/tools/archive/refs/tags/latest.zip
unzip latest.zip
mkdir -p .local/bin
mv tools-latest/* .local/bin/.
rm -rf tools-latest latest.zip
echo "source ~/.local/bin/aliases" >> .bashrc
