" Key mappings and misc plugins
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'skywind3000/asyncrun.vim'
" Chinese vim help docs
Plug 'yianwillis/vimcdoc'
nmap <C-n> :NERDTree<cr>
nmap <C-l> :TagbarToggle<cr>
" Search the current word in the location window
nmap <leader>fw :lv /<c-r>=expand("<cword>")<esc>/ %<cr>:lw<cr>
" Search the current search pattern in the location window
nmap <leader>fs :lv // %<cr>:lw<cr>
" Disable the annoying 'Press ENTER to continue' message
nnoremap K K<CR>
vnoremap K K<CR>
