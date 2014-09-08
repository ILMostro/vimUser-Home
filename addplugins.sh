#!/usr/bin/env bash

if
  [ ! -d $1 ]; then
  exec mkdir -p $HOME/.vim/{autoload,bundle}
fi

## git submodule update --init --recursive
## git submodule foreach --recursive git pull origin master
## -----------------------------------------------
## don't forget to add this to your ~/.vimrc file
## the first time, to initialize 'pathogen':
## filetype off
## call pathogen#runtime_append_all_bundles()
## call pathogen#helptags()
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
#git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
git submodule add https://github.com/tpope/vim-surround.git bundle/surround
git submodule add https://github.com/tpope/vim-git.git bundle/git
git submodule add https://github.com/ervandew/supertab.git bundle/supertab
git submodule add https://github.com/sontek/minibufexpl.vim.git bundle/minibufexpl
git submodule add https://github.com/wincent/Command-T.git bundle/command-t
git submodule add https://github.com/mitechie/pyflakes-pathogen.git
git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc
git submodule add https://github.com/vim-scripts/pep8.git bundle/pep8
git submodule add https://github.com/alfredodeza/pytest.vim.git bundle/py.test
git submodule add https://github.com/reinh/vim-makegreen bundle/makegreen
git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
git submodule add https://github.com/sontek/rope-vim.git bundle/ropevim
#git submodule add https://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter 
git submodule add https://github.com/tomtom/tcomment_vim.git bundle/tcomment
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
