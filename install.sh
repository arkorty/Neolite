#!/bin/bash

[ -d "$HOME/.local/share/nvim/site/pack/packer" ] && rm -rf $HOME/.local/share/nvim/site/pack/packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

[ -d "$HOME/.config/nvim" ] && mv $HOME/.config/nvim $HOME/.config/nvim-(date "+%F-%T").bak

mkdir -p $HOME/.config/nvim && git clone --depth 1 https://github.com/arkorty/neolite.git $HOME/.config/nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim +TSUpdate "+MasonInstall stylua rustfmt prettier black clang-format"
