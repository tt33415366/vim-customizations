" Add by Lea
set number
set cin
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set showmatch
set hlsearch
set tag=tags;
set autochdir
set autowrite   " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
" set mouse=a
filetype on
highlight leastyle term=bold cterm=bold ctermfg=red
match leastyle "\<\(LEA\|Lea\):"
set viminfo='20,<1000,s1000
" Enable syntax based folding
set foldmethod=syntax
" Default not fold up
set foldlevelstart=99

if has("syntax")
  " The differences between `syntax on` and `syntax enable` are that one will
  " overrule the your settings while the other would not.
  syntax on
endif

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
  " Enabling VIM to load plugins and indention rules based on the detected
  " filetype.
  filetype plugin indent on
endif

" Auto generate tags file on file write of *.c and *.h files
autocmd BufWritePost *.cpp,*.c,*.h silent! !ctags . &

" Enable viewing manpage with vim via Man command
runtime! ftplugin/man.vim
