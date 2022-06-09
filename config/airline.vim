" vim-airline configuration
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
" Smarter tab line
let g:airline#extensions#tabline#enabled = 1
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
