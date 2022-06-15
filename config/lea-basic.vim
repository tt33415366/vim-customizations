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

" Auto generate tags file on file write of *.c and *.h files
autocmd BufWritePost *.cpp,*.c,*.h silent! !ctags . &
