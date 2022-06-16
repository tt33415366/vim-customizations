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
if has("autocmd")
  augroup syntax_fold
    autocmd!
	autocmd BufNewFile,BufRead *.h,*.c,*.cpp,*.cc setlocal foldmethod=syntax
  augroup END
  augroup vim_fold
    autocmd!
    autocmd BufNewFile,BufRead .vimrc,vimrc,*.vim setlocal foldmethod=marker
  augroup END
  " Enable syntax based folding
  set foldmethod=syntax
endif
" Default not fold up
set foldlevelstart=99
