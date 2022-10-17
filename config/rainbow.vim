" Rainbow parentheses
Plug 'luochen1990/rainbow'
" --OR--
" Plugin 'frazrepo/vim-rainbow'
let g:rainbow_active = 1
" Rainbow is really slow on startup while handling large files, and it does
" not make much sense to enable it with text/log file.
let g:rainbow_conf = {
      \  'separately': {
      \     '*':{},
      \     'text':0,
      \     'log':0
      \  }
      \}
