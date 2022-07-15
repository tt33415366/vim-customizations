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
if has("extra_search")
  " While typing a search command, show where the pattern, as it was typed
  " so far, matches. 
  set incsearch
endif
set tag=tags;
set autochdir
set autowrite   " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set cmdheight=2 " Avoid the annoying `hit-enter` message
" set mouse=a
filetype on
highlight leastyle term=bold cterm=bold ctermfg=red
match leastyle "\<\(LEA\|Lea\):"

if has("viminfo")
  " Marks will be remembered for the last 20 files you edited.
  " Contents of registers (up to 1000 lines each) will be remembered
  " Registers with more than 1000 Kbyte text are skipped.
  set viminfo='20,<1000,s1000
endif

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

" gVIM specific
if has("gui_running")
	colorscheme peachpuff
	set guifont=Source_Code_Pro:h14:cANSI:qDRAFT
endif	

" Enable viewing manpage with vim via Man command
runtime! ftplugin/man.vim
