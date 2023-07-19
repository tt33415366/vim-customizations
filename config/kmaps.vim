" Key mappings and misc plugins
" Doing a lazy loading with tagbar
Plug 'skywind3000/asyncrun.vim'
" Chinese vim help docs
Plug 'yianwillis/vimcdoc'

" Search the current word in the location window
nmap <leader>fw :lv /<c-r>=expand("<cword>")<esc>/ %<cr>:lw<cr>
" Search the current search pattern in the location window
nmap <leader>fs :lv // %<cr>:lw<cr>
" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Disable the annoying 'Press ENTER to continue' message
nnoremap K K<CR>
vnoremap K K<CR>

if has("autocmd")
  " These plugin provided functions only exists after `VimEnter`.
  autocmd VimEnter * if exists(":NERDTreeToggle")
        \ | exec "nmap <C-n> :NERDTreeToggle\<cr>"
        \ | endif
  autocmd VimEnter * if exists(":Tagbar")
        \ | exec "nmap <C-l> :TagbarToggle\<cr>"
        \ | endif
  " Align structure
  autocmd VimEnter * if exists(":Tabularize")
        \ | exec "nnoremap <leader>ts :Tabularize /\\S\\+;\<CR>"
        \ | exec "vnoremap <leader>ts :Tabularize /\\S\\+;\<CR>"
        \ | endif
  " Align assignments
  autocmd VimEnter * if exists(":Tabularize")
        \ | exec "nnoremap <leader>te :Tabularize /=\<CR>"
        \ | exec "vnoremap <leader>te :Tabularize /=\<CR>"
        \ | endif
  " Hunks manipuate
  autocmd VimEnter * if exists(":SignifyToggle")
        \ | exec "nnoremap <leader>hd :SignifyDiff<cr>"
        \ | exec "nnoremap <leader>hp :SignifyHunkDiff<cr>"
        \ | exec "nnoremap <leader>hu :SignifyHunkUndo<cr>"
        \ | endif
endif

noremap <C-Up> :PreviewScroll -1<cr>
noremap <C-Down> :PreviewScroll +1<cr>
inoremap <C-Up> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <C-Down> <c-\><c-o>:PreviewScroll +1<cr>
