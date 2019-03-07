#!/bin/sh
# install packages
sudo apk add ctags go git tmux vim rust tig cargo musl-dev libc-dev make fzf
# Create folders
mkdir $HOME/.go && mkdir $HOME/.vim && mkdir $HOME/.vim/bundle && mkdir $HOME/.vim/autoload && mkdir $HOME/.vim/plugin

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "export GOPATH=$HOME/.go" >> .zshrc
echo "export PATH=$GOPATH/bin:$HOME/.cargo/bin:$PATH" >> .zshrc
echo "TERM=xterm-265color" >> .zshrc
chsh -s /bin/zsh

# Install golang-ide
## Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
## vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
## vim-go
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
vim +GoInstallBinaries +qall
## gometalinter
go get -u github.com/alecthomas/gometalinter
gometalinter --install
## Autocompletion - Completor
git clone https://github.com/maralla/completor.vim.git ~/.vim/bundle/completor/

## lightline
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim

## TagBar
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar/

## neopsnippet
git clone https://github.com/Shougo/neosnippet.vim.git ~/.vim/bundle/neosnippet/
git clone https://github.com/Shougo/neosnippet-snippets.git ~/.vim/bundle/neosnippet-snippets/

## Fugitive
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive/
vim -u NONE -c "helptags vim-fugitive/doc" -c q

## Nerd Commenter
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter/

## Vim-autopairs
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

## Surround
git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround/

## NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

## ripgrep
cargo install ripgrep
git clone https://github.com/jremmen/vim-ripgrep.git ~/.vim/plugin/vim-ripgrep

## install plug
vim +PlugInstall +qall
