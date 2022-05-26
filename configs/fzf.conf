" Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plugin 'junegunn/fzf.vim'
" FZF
let $FZF_DEFAULT_OPTS="--preview='less {}' --bind ctrl-j:preview-page-up,ctrl-k:preview-page-down"
nnoremap <c-p> :Files<cr>
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)
