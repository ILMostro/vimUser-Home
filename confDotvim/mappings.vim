"" let mapleader=","             " change the leader to be a comma vs slash
nmap <leader>sb :call SplitScroll()<CR>

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Toggle the tasklist
map <leader>td <Plug>TaskList

" Run pep8"{{{
let g:pep8_map='<leader>8'

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>
"}}}
" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>C :copen<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split"{{{
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>
"}}}
" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" map <leader>f :CtrlP<CR>
" map <leader>b :CtrlPBuffer<CR>

" Ack searching
nmap <leader>a <Esc>:Ack!

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" ===========================================
"" at this point in original vimrc-custom
"" pathogen is loaded, etc followed by
"" the remaining mappings (**just in case**)
" ---------Amel-------
" ===========================================


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" don't outdent hashes
inoremap # #



" CLIPBOARD see the following link for further info
" http://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim?lq=1
" Use PRIMARY clipboard (*) with 'y' and 'p'
noremap <Leader>y "*y
noremap <Leader>p "*p
" Use 'regular' CLIPBOARD with 'y' and 'p'
noremap <Leader>Y "+y
noremap <Leader>P "+P



" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ============================================================
" Additional customizations, based largely on Hacking Vim Book
" ============================================================

" Ctrl-S will save current file
" Careful with the Ctrl-S Shortcut, as some terminal use that
" key-combo for ixoff
map <C-s> :w<cr>
" make sure Ctrl-S saves file when we're in insert mode
imap <C-s> <esc>:w<cr>a

" Changed shortcut keys for tComment plugin
nnoremap <leader><leader> :TComment<CR>

" Enter key on a link will move to where link is pointing"{{{
nmap <buffer> <CR> <C-]>
" Backspace can move back inside buffers to previous place
nmap <buffer> <BS> <C-T>

" Switch buffers with Ctrl-left/right
map <leader><Right> <ESC>:bn<CR>
map <leader><Left> <ESC>:bp<CR>
"}}}
" Define a 'sign' and map it to F7 shortcut key"{{{
"   NOT implemented correctly as is-----------
" Add the sign we just defined, named 'information', under the ID 123
" to the current line (line(.)) in the currently open file (expand("%:p")).
" :exe ":sign place 123 line=" . line(.) ."name=information file=" . expand("%:p")
" Mapping this to a line is:
" map <F7> :exe ":sign place 123 line=" . line(".") ."name=information file=" . expand("%:p")<CR>
"}}}

" Mapping 'Ctrl-i' to jump between placeholders in '.tpl' files (templates)
" nnoremap <c-i> /<+.\{-1,}+><cr>c/+>/e<cr>
" inoremap <c-i> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>
" do mapping as above only in certain filetype (.tpl template)
au FileType html,java nnoremap <c-i> /<+.\{-1,}+><cr>c/+>/e<cr> 
au FileType html,java inoremap <c-i> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr> 
" au FileType html map <c-i> /<+.\{-1,}+><cr>c/+>/e<cr> 

" Set filetype based on directory
au BufNewFile,BufRead /etc/* set syntax=conf

inoremap jj <Esc>
" Highlight the current line
hi CursorLine term=bold cterm=bold ctermbg=Cyan
" Toggle highlighting on/off with \c
nnoremap <Leader>c :set cursorline!<CR>
" Pressing SPACE clears search highlighting and any message already displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Toggle MiniBuffer tab bar visibility
" map <F3> :TMiniBufExplorer<cr>
map <F3> :MBEToggle<cr>
" Mappings to access buffers
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>

" Insert singlequotes from current position to end of line
map <Leader>' Wgewi'<Esc>A'<Esc>w

" toggle 'paste' mode
set pastetoggle=<F4>

