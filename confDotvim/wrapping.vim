" External vim file that's optionally sourced from within
" ~/.vimrc to allow wrapping long lines of text at a specified
" column-width.
" Put this in your ~/.vimrc file: source /path/to/this-file.vim
"
set wrap
" set the 'numberwidth' option at a fixed length, since those
" 'widths' are counted toward the column width setting
set nuw=4
" set the column desired column width at which to wrap lines
set columns=84

" Optionally, there's also a way to highlight the desired column
"set colorcolumn=84
" Also, you can highlight ALL the columns past a given width
" :match ErrorMsg '\%>84v.\_'

" Toggle matching based on textwidth;
" Directly copied from vim-wikia at
" http://vim.wikia.com/wiki/Highlight_long_lines

nnoremap <silent> <Leader>l
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>84v.\+', -1) <Bar>
      \ endif<CR>

