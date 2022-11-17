" Key mappings and misc plugins
" Doing a lazy loading with tagbar
Plug 'preservim/tagbar', { 'for': [ 'c', 'cpp' ] }
Plug 'skywind3000/asyncrun.vim'
" Chinese vim help docs
Plug 'yianwillis/vimcdoc'
nmap <C-n> :NERDTreeToggle<cr>
nmap <C-l> :TagbarToggle<cr>
" Search the current word in the location window
nmap <leader>fw :lv /<c-r>=expand("<cword>")<esc>/ %<cr>:lw<cr>
" Search the current search pattern in the location window
nmap <leader>fs :lv // %<cr>:lw<cr>
" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Disable the annoying 'Press ENTER to continue' message
nnoremap K K<CR>
vnoremap K K<CR>
" Sort tags by their order in the source file. Press 's' to sort them
" alphabetically.
let g:tagbar_sort = 0
" Automatically moved to tagbar window while it is opened.
let g:tagbar_autofocus = 1
