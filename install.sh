#!/bin/bash

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

[ -d "~/.config/nvim" ] && mv ~/.config/nvim ~/.config/nvim.bak

[ ! -d "~/.config/nvim" ] && mkdir -p ~/.config/nvim

cp -r init.lua lua ~/.config/nvim

nvim +PackerSync
