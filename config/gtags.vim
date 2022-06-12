" Gutentags is a plugin that takes care of the much needed management of tags files in Vim.
" It requires following three plugins to work with.
"
" Default Key Maps
"   <leader>cs	Find symbol (reference) under cursor
"   <leader>cg	Find symbol definition under cursor
"   <leader>cd	Functions called by this function
"   <leader>cc	Functions calling this function
"   <leader>ct	Find text string under cursor
"   <leader>ce	Find egrep pattern under cursor
"   <leader>cf	Find file name under cursor
"   <leader>ci	Find files #including the file name under cursor
"   <leader>ca	Find places where current symbol is assigned
"   <leader>cz	Find current word in ctags database
"
" gtags is also required: apt install global
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'skywind3000/gutentags_plus'
" Plugin 'skywind3000/vim-preview'

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 禁用 gutentags 自动加载 gtags 数据库的行为，
" 避免多个项目的数据库相互影响
let g:gutentags_auto_add_gtags_cscope = 0

" Enable gutentags debug tracing
" View with `:messages`
" let g:gutentags_trace = 1

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
