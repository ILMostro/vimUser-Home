" https://github.com/sontek/dotfiles/"{{{
" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pep8 - http://pypi.python.org/pypi/pep8
" Pyflakes
" Ack
" nose, django-nose

" ==========================================================
" Plugins included
" ==========================================================
" Pathogen
"     Better Management of VIM plugins
"
" GunDo
"     Visual Undo in vim with diff's to check the differences
"
" Pytest
"     Runs your Python tests in Vim.
"
" Commant-T
"     Allows easy search and opening of files within a given path
"
" Snipmate
"     Configurable snippets to avoid re-typing common comands
"
" PyFlakes
"     Underlines and displays errors with Python on-the-fly
"
" Fugitive
"    Interface with git from vim
"
" Git
"    Syntax highlighting for git config files
"
" Pydoc
"    Opens up pydoc within vim
"
" Surround
"    Allows you to surround text with open/close tags
"
" Py.test
"    Run py.test test's from within vim
"
" MakeGreen
"    Generic test runner that works with nose
"
" ==========================================================
" Shortcuts
" =========================================================="}}}

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

fu! SplitScroll() "{{{
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu
"}}}

"<CR><C-w>l<C-f>:set scrollbind<CR>

" =============================================================
" *************************************************************
" Custom 'customized vimrc' exporting mappings to external file
" *************************************************************
" =============================================================

" Mapped shortcut keys are stored in, and loaded from this file:
source $HOME/.vim/confDotvim/mappings.vim

" =========================================================="{{{
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
call pathogen#infect()
"call pathogen#incubate()
call pathogen#helptags()
"}}}
" ==========================================================
" Basic Settings
" ==========================================================
"{{{
syntax on                     " syntax highlighing {{{  }}}
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
"}}}
" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing"{{{
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
"}}}
set grepprg=ack         " replace the default grep program with ack



" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
autocmd FileType * setlocal colorcolumn=0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing"{{{
" set cursorline              " have a line indicate the cursor location
                            " this is already set in /etc/vimrc
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
"set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
"set foldmethod=indent       " allow us to fold on indents
"set foldlevel=99            " don't fold by default
                            "   change to indent for Python"}}}


" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing"{{{
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
"}}}
"""" Messages, Info, Status"{{{
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}\ [type=%Y]\ [LEN=%L] 
"}}}
" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list

""" Searching and Patterns"{{{
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
"}}}
"""" Display"{{{
"" COMMENTED OUT; no GUI installed on FedPadSSD
"if has("gui_running")
"    " Remove menu bar
"    set guioptions-=m
"
"    " Remove toolbar
"    set guioptions-=T
"endif
"}}}
" colorscheme molokai
" colo vividchalk
colo desert

"{{{
set nobackup		" do not keep a backup file, use versions instead

set history=50		" keep 50 lines of command line history
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
"}}}

" =========================================================="{{{
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

let g:acp_completeoptPreview=1
"}}}
" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Amel---Load templates into newly-created files of a certain type
autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl

" Amel---Display 'sh' syntax-highlighting for '*.log' files
au BufNewFile,BufRead *.log setf sh

" Amel---Display 'sh' syntax-highlighting for '*.rpmmacros' file
au BufNewFile,BufRead *.rpmmacros setf sh

" Python"{{{
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0



" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
"}}}
" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

"source $HOME/.vim/confDotvim/wrapping.vim
source $HOME/.vim/abbreviations.vim
set nu
