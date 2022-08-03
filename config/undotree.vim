Plug 'mbbill/undotree'
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
" Open/Close the Undotree and switch to it if possible. Noticed that you could
" always use `J`/`K` in Undotree window to do a faster undo/redo history preview.
nmap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
