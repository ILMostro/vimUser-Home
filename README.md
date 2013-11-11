vimUser-Home
============
This repo holds various snippets, templates, and other configuration options for VIM-7.2+,
which I prefer to keep in the user's home directory under `/home/user/.vim/`

The templates folder holds language-specific template files which all
have the ".tpl" file extension. Their contents are inserted into a
newly-created page with the various language-specific file extensions,
i.e. html.tpl, java.tpl, c.tpl, etc.
Meaning, when you create a new file, e.g. index.html, VIM will use
the template named html.tpl (whatever you decide to include in it) to fill in
the skeleton of the new file you'll want to create.  VIM only does this
with newly-created files, not with existing files which already contain
their own lines of code/text.

You are free to create templates
for any programming language as long as they adhere to the above-mentioned
naming standards.

**IMPORTANT**
Those "templates" need to be sourced in user's '.vimrc' file as such:

    autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl

Further options include creating placeholders and mapping
a shortcut key to jump between them as you insert the text.
For example, in the HTML template:

    <title><+INSERT TITLE+></title>

The following key-mapping binds Ctrl-k to jump between the
placeholders enclosed with the "<+ +>" tags. (NOTE: no Quotation Marks)

    au FileType html nnoremap <c-k> /<+.\{-1,}+><cr>c/+>/e<cr>
    
This will ensure that the mapping works in INSERT mode as well:

    au FileType html inoremap <c-k> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>

Alternatively, you can leave out the `au FileType html` part of the
keymapping to apply it to all filetypes (as long as you put placeholders between <+ +> tags);
or, you can just append more filetypes in a comma-separated list: html,java,c,...etc.


Furthermore, the shortcut key-mappings are all stored in the confDotvim/mappings.vim file.
Once again, they are sourced in the '.vimrc' file as such:
    
    `source /home/user/.vim/confDotvim/mappings.vim`
    

Also, the abbreviations.vim file holds, tadaa! abbreviations, what else.
Set them in INSERT mod (iabbr) commandline-mode (cabbr)
  Find more info about abbreviations in VIM at the following link
  as well as the other listed links at the bottom of that page:
  
    http://vim.wikia.com/wiki/Using_abbreviations
  

Lastly, the addplugins.sh file is a copied/customized/edited version of
one included in sontek's github/dotfiles repo.  It's referenced in his
tutorial on using VIM for coding in Python; it's available
at the following link:

    http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
    
    
    MORE TO COME...
