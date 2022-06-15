# Usage
## Install Vundle First
### Set up Vundle
```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
### Configure Plugins
Put this at the top of your .vimrc to use Vundle. Remove plugins you don't need, they are for illustration purposes.
```vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
```
### Install Plugins:

Launch vim and run `:PluginInstall`

To install from command line: `vim +PluginInstall +qall`
## Getting all the custom configurations
Changing to your vim's home directory(mostly just `~/.vim`), and executing the following commands.
```shell
$git init
$git remote add origin <url of this repository>
$git pull origin main --allow-unrelated-histories
```
## Enabling the custom configurations
Executing command `vim ~/.vimrc`, pasting the followings into the end of the file, save and quit.
```vim
source $HOME/.vim/config/diff-colorscheme.vim
source $HOME/.vim/config/lea-basic.vim
source $HOME/.vim/config/kmaps.vim
source $HOME/.vim/config/fzf.vim
source $HOME/.vim/config/airline.vim
source $HOME/.vim/config/rainbow.vim
source $HOME/.vim/config/gtags.vim
```
