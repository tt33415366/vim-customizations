" <leader>hp, Hunk Preview
" <leader>hs, Hunk Stage
" <leader>hu, Hunk Undo
Plug 'airblade/vim-gitgutter'

highlight GitGutterAdd    ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red
let g:gitgutter_preview_win_floating=1
let g:gitgutter_close_preview_on_escape=1
