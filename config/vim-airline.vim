" vim-airline configuration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
" Smarter tab line
let g:airline#extensions#tabline#enabled = 1
" This searchcount extensions really slows down vim a lot while handling large files.
let g:airline#extensions#searchcount#enabled = 0
" Themes
let g:airline_theme='sol'
" Cutomize the theme
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' COL:'
let g:airline_symbols.linenr = ' LN:'
" set laststatus=2
" set showtabline=2
set noshowmode
