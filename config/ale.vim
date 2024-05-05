Plug 'dense-analysis/ale'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" By default, ALE displays errors and warnings with virtual text. The problems
" ALE shows appear with comment-like syntax after every problem found. You can
" set ALE to only show problems where the cursor currently lies like so.
let g:ale_virtualtext_cursor = 'current'
