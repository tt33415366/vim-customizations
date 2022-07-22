# Usage
## Install vim-plug First
### Set up vim-plug
```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### Configure Plugins
Put this at the top of your .vimrc to use vim-plug. Remove plugins you don't need, they are for illustration purposes.
```vim
call plug#begin()
	..." plugins
call plug#end()
```
Save the file and source it.
```vim
:source %
```
### Install Plugins:

Launch vim and run `:PlugInstall`

## Getting all the custom configurations
Changing to your vim's home directory(mostly just `~/.vim`), and executing the following commands.
```shell
$git init
$git remote add origin <url of this repository>
$git pull origin vim-plug --allow-unrelated-histories
```
## Enabling the custom configurations
Executing command `vim ~/.vimrc`, pasting the followings into the plugin management section(the spaces between `call plug#begin()` and `call plug#end()`), save, source it(`:source %`) then run plug install command (`:PlugInstall`), waiting for it to be done and you're good to go. 
```vim
source $HOME/.vim/config/diff-colorscheme.vim
source $HOME/.vim/config/lea-basic.vim
source $HOME/.vim/config/fold.vim
source $HOME/.vim/config/kmaps.vim
source $HOME/.vim/config/nerdtree.vim
source $HOME/.vim/config/fzf.vim
source $HOME/.vim/config/vim-airline.vim
source $HOME/.vim/config/rainbow.vim
source $HOME/.vim/config/gtags.vim
source $HOME/.vim/config/undotree.vim
source $HOME/.vim/config/quickfix.vim
source $HOME/.vim/config/vim-fugitive.vim
source $HOME/.vim/config/vim-unimpaired.vim
source $HOME/.vim/config/vim-visual-star-search.vim
source $HOME/.vim/config/coc.vim
```
## Misc.
### Operating on vim's variables
```vim
Here's how to show, set, and reset vim's variables:

:set            - shows vars different from defaults
:set all        - shows all values
:set foo?       - shows the value of foo
:set foo+=opt   - add opt to the value w/o changing others
:set foo-=opt   - remove opt from value
:set foo&       - reset foo to default value
:setlocal foo   - only the current buffer
```
