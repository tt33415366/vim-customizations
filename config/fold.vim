" set foldopen=all           " Open folds where the current cursor is in.
set foldclose=all            " Close folds where the current cursor is in.

" zf - zf{motion}, operator to create a fold.
" zo - Open one fold under the cursor.
" zc - Close one fold under the cursor.
" zd - Delete one fold at the cursor.
" zr - Reduce folding: Add |v:count1| to 'foldlevel'.
" zm - Fold more: Subtract |v:count1| from 'foldlevel'.
" zR - Open all folds.  This sets 'foldlevel' to highest fold level.
" zM - Close all folds: set 'foldlevel' to 0.
" zn - Fold none: reset 'foldenable'.  All folds will be open.
" zi - Invert 'foldenable'.
" zN - Fold normal: set 'foldenable'.
"      All folds will be as they were before.

" Enable syntax based folding by default
set foldmethod=syntax
if has("autocmd")
  augroup syntax_fold
    " Clear all autocmds in this group.
    autocmd!
    autocmd BufNewFile,BufReadPre *.h,*.c,*.cpp,*.cc setlocal foldmethod=syntax
    autocmd BufWinEnter  *.h,*.c,*.cpp,*.cc if &fdm == 'syntax' | setlocal foldmethod=manual | endif
  augroup END
  augroup vim_fold
    autocmd!
    autocmd BufNewFile,BufReadPre .vimrc,vimrc,*.vim setlocal foldmethod=indent
    autocmd BufWinEnter .vimrc,vimrc,*.vim if &fdm == 'indent' | setlocal foldmethod=manual | endif
  augroup END
endif
" Default not fold up
set foldlevelstart=99
