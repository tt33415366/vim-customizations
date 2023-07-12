" Add by Lea
set number
set cin
set autoindent
set smartindent
" Place C++ scope declarations N characters from the indent of the block they
" are in. (default 'shiftwidth').
" Check `:help cinoptions-values` for detailed explainations
set cinoptions=g0
" Place case labels 0 characters from the indent of the switch().
" This conforms to the Linux coding style.
set cinoptions+=:0
" Prefer a `.clang-format` over these fixed tab values
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
set smarttab
set showmatch
set hlsearch
if has("extra_search")
  " While typing a search command, show where the pattern, as it was typed
  " so far, matches.
  set incsearch
endif
set cursorline
set tag=tags;
set autochdir
set autowrite   " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set cmdheight=2 " Avoid the annoying `hit-enter` message
" set mouse=a
" When working with Coc.nvim enabled, the backspace might be set to other
" values occationally, which might be very inconvenient, fixed setting it
" here.
set backspace=indent,eol,start
filetype on

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

  augroup CnComment
    autocmd!
    " For those who would like to write chinese comments within source code.
    autocmd BufReadPre *.cpp,*.c,*.h setlocal fileencodings=ucs-bom,utf-8,chinese,cp936
  augroup END

  augroup NoLineCommentCnt
    autocmd!
    " Don't automatically continue comment in new line for line-based comment
    autocmd BufEnter *.cpp,*.c,*.h setlocal comments-=:// comments+=fO://
  augroup END

  augroup AutoCtagsAfterWrite
    autocmd!
    " Auto generate tags file on file write of *.c and *.h files
    autocmd BufWritePost *.cpp,*.c,*.h silent! !ctags . &
  augroup END

  augroup CusSignatureHighlight
    autocmd!
    " Custom signature highlight
    highlight leastyle term=bold cterm=bold ctermfg=red
    autocmd ColorScheme * highlight leastyle term=bold cterm=bold ctermfg=red
    match leastyle "\<\(LEA\|Lea\):"
    au BufWinEnter * call matchadd("leastyle", '\<\(LEA\|Lea\):')
    au InsertEnter * call matchadd("leastyle", '\<\(LEA\|Lea\):')
    au InsertLeave * call matchadd("leastyle", '\<\(LEA\|Lea\):')
  augroup END

  augroup WarnExtraWhitespace
    autocmd!
    " Warn about extra white space
    highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    au BufWinEnter * call matchadd("ExtraWhitespace", '\s\+$')
    au InsertEnter * call matchadd("ExtraWhitespace", '\s\+\%#\@<!$')
    au InsertLeave * call matchadd("ExtraWhitespace", '\s\+$')
    au BufWinLeave * call clearmatches()
  augroup END

  augroup CommitMsgConf
    " disable coc in git commits, enable spell checking instead.
    autocmd BufRead,BufNewFile COMMIT_EDITMSG let b:coc_enabled=0
    autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell
    autocmd BufRead,BufNewFile COMMIT_EDITMSG set tabstop=4
    autocmd BufRead,BufNewFile COMMIT_EDITMSG set softtabstop=4
    autocmd BufRead,BufNewFile COMMIT_EDITMSG set shiftwidth=4
  augroup END

  " Enabling VIM to load plugins and indention rules based on the detected
  " filetype.
  filetype plugin indent on
endif

" gVIM specific
if has("gui_running")
	colorscheme peachpuff
	set guifont=Source_Code_Pro:h14:cANSI:qDRAFT
else
	colorscheme gruvbox
	set background=dark
endif

" Enable viewing manpage with vim via Man command
runtime! ftplugin/man.vim
