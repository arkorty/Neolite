#!/bin/bash

[ -d "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ] && rm -rf\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

[ -d "~/.config/nvim" ] && mv ~/.config/nvim ~/.config/nvim-$(date "+%F-%T").bak

mkdir -p ~/.config/nvim && git clone --depth 1 https://github.com/arkorty/neolite.git
 ~/.config/nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim +TSUpdate "+MasonInstall stylua rustfmt prettier black clang-format"