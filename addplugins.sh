#!/usr/bin/env bash

if
  [ !-f $1 ];
then
  cp -r .vimrc ~/.vimrc
# else
  # cp -r ~/.vimrc{,.bak} && cp -r .vimrc ~/.vimrc
  # mv ~/.vimrc{,.bak}
  # cp -r .vimrc ~/.vimrc
fi

if
  [ !-d $1 ];
then
  mkdir $HOME/.vim
fi

cp .vimrc $HOME/
cp -r confDotvim templates $HOME/.vim/

cd $HOME/.vim

if
  [ !-d $1 ];
then
  mkdir $HOME/.vim/bundle
fi

git init

#if
#  [ !-d .git ];
#then
#  exec git init
#fi

sleep 3

## git submodule update --init --recursive
## git submodule foreach --recursive git pull origin master
## -----------------------------------------------
git clone https://github.com/tpope/vim-pathogen.git
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
#git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
git submodule add https://github.com/SirVer/ultisnips.git bundle/ultisnips
git submodule add https://github.com/tpope/vim-surround.git bundle/surround
#git submodule add https://github.com/tpope/vim-git.git bundle/git
#git submodule add https://github.com/ervandew/supertab.git bundle/supertab
git submodule add https://github.com/fholgado/minibufexpl.vim.git bundle/minibufexpl
git submodule add https://github.com/wincent/Command-T.git bundle/command-t
# git submodule add https://github.com/mitechie/pyflakes-pathogen.git
git submodule add https://github.com/tpope/vim-pathogen.git
git submodule add https://github.com/plasticboy/vim-markdown.git bundle/markdown
git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc
git submodule add https://github.com/vim-scripts/pep8.git bundle/pep8
git submodule add https://github.com/alfredodeza/pytest.vim.git bundle/py.test
git submodule add https://github.com/reinh/vim-makegreen bundle/makegreen
git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
#git submodule add https://github.com/sontek/rope-vim.git bundle/ropevim
#git submodule add https://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter 
git submodule add https://github.com/tomtom/tcomment_vim.git bundle/tcomment
git submodule add https://github.com/godlygeek/tabular bundle/tabular
## ------------------------
## additional plugins
git submodule add https://github.com/kien/ctrlp.vim.git bundle/ctrlp
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
sleep 10
echo "don't forget to add this to your ~/.vimrc file
the first time, to initialize 'pathogen':
filetype off
call pathogen#infect()
call pathogen#helptags()"

mv ./vim-pathogen/autoload .

#if
#  [ !-d autoload ];
#then
#  mv ./vim-pathogen/autoload .
#fi

# test for Error codes
if (( $? )) ; then echo failed ; else echo OK; fi

exit 
