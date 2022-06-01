# Usage
## Getting all the custom configurations
Changing to your vim's home directory(mostly just `~/.vim`), and executing the following commands.
```shell
$git init
$git remote add origin <url of this repository>
$git pull origin main --allow-unrelated-histories
```
## Enabling the custom configurations
Executing command `vim ~/.vimrc`, pasting the followings into the end of the file, save and quit.
```
source $HOME/.vim/config/diff-colorscheme.vim
source $HOME/.vim/config/lea-basic.vim
source $HOME/.vim/config/kmaps.vim
source $HOME/.vim/config/fzf.vim
source $HOME/.vim/config/airline.vim
source $HOME/.vim/config/gtags.vim
```
