# Usage
## Install
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
source $HOME/.vim/config/tagbar.vim
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
source $HOME/.vim/config/indent.vim
source $HOME/.vim/config/tabular.vim
source $HOME/.vim/config/vim-gitgutter.vim
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
### Figuring out what the key maps to in vim
```vim
:verbose i/n/vmap <hot-key>
```
#### Figuring out the key notations
```vim
:help key-notation
```
### Profiling plugin/function loaded with VIM
#### Using the builtin `profile` function directly
```vim
:profile start profile.log
:profile func *
:profile file *
" At this point do slow actions
:profile pause
:noautocmd qall!
```
#### Using the builtin `--startuptime` option
```shell
--startuptime <file> Write startup timing messages to <file>
```
### Integrating fzf into your shell environment
```shell
$ ~/.vim/plugged/fzf/install
Downloading bin/fzf ...
  - Already exists
    - Checking fzf executable ... 0.31.0
	Do you want to enable fuzzy auto-completion? ([y]/n)
```
### Coc.nvim

#### Requirements

Coc.nvim plugin required specific(mostly the newest one) nodejs to be installed, and 
can install it via the following commands:

```shell
sudo apt install nodejs
```
In case you need to upgrade nodejs to a specicif version, you can have it done with
the following commands:

```shell
sudo apt install npm
sudo npm install -g n
sudo n stable
```
N.B. stable can be changed to latest, if you want the newest one of nodejs.

##### Possible Errors

- `build/index.js` not found
   ```shell
   [coc.nvim] build/index.js not found, please install dependencies and compile coc.nvim by: yarn install
   ```
   Switch to the Coc.nvim(mostly `~/.vim/plugged/coc.nvim/`) directory, checkout the release branch.

#### Coc.nvim v0.0.82 is a breakthrough upgrade

It requires vim >= 8.1.1719 or neovim >= 0.4.0 and nodejs >= 12.12, though it's highly recommanded  
to upgrade to the newest version, but for those who just simply can't, here's a rescue:

```shell
git checkout Coc.nvim-v0.0.81
```
#### View direct output from specific  LSP(Language Service Provider) or plugin

```shell
:CocCommand workspace.showOutput
```

### Enabling C/C++/Objective-C autocompletion with Coc

```vim
:CocInstall coc-clangd
```
This required clangd to work with, you could install it with the following command:
```shell
sudo apt install clangd
```
#### Project setup
Although clangd can work out of box for most of simple projects, it is recommanded to generate a `compile_commands.json` for a new project, and this file can be easily generated within a few steps:
- CMake based project
```shell
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
cd ..
ln -s build/compile_commands.json compile_commands.json
```
- Make based project
```shell
sudo apt install bear
bear make
```
N.B. Linux kernel has a `gen_compile_commands.py` script to do this by simply parsing the `.<target>.o.cmd` files.
##### .clangd
It is also highly recommanded to generate a project specific file named `.clangd` to instruct clangd to do some extra linting things.
A typical `.clangd` would looks like:

```yaml
CompileFlags:       # Tweak the parse settings
	Add: []         # List of flags to append to the compile command.
	Remove: []      # List of flags to remove from the compile command.

---
If:
	PathExclude: [ .*\.c, .*\.h ] # Do not apply to .c/.h files
CompileFlags:
	Add: [ -std=c++11 ]
---

Diagnostics:
	ClangTidy:          # Configure how clang-tidy runs over your files.
		Add: [bugprone-*, modernize*, performance-*]         # List of checks. These can be globs, for example Add: 'bugprone-*'.
		Remove: [modernize-use-trailing-return-type]         # List of checks to disable, can be globs.
		CheckOptions:
			readability-function-cognitive-complexity: IgnoreMacros # Options for specific check

```
- `–--` delimits fragments

  Each file can contain multiple fragments separated by `---` lines. (This is only useful if the fragments have different `If` conditions).

- The detailed `.clangd` configurations can be found [here](https://clangd.llvm.org/config).

- The detailed clang-tidy checks can be found [here](https://clangd.llvm.org/config.html#clangtidy). 

- N.B. The indents in the yaml file **MUST** be `<TAB>`.

##### .clang-format

[Clang-Format Style Options](https://clang.llvm.org/docs/ClangFormatStyleOptions.html#) describes configurable formatting style options supported by [LibFormat](https://clang.llvm.org/docs/LibFormat.html) and [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html).

- [LLVM Coding Standards](https://llvm.org/docs/CodingStandards.html)

  This is the default clang format.

- [Linux kernel coding style](https://www.kernel.org/doc/html/v4.10/process/coding-style.html)

  ```yaml
  BasedOnStyle: LLVM
  IndentWidth: 8
  UseTab: Always
  BreakBeforeBraces: Linux
  AllowShortIfStatementsOnASingleLine: false
  IndentCaseLabels: false
  ```

- [Google's C++ Coding Style](https://google.github.io/styleguide/cppguide.html)

  ```yaml
  BasedOnStyle: google
  ```

### Enabling Python autocompletion with Coc

```vim
:CocInstall coc-pyright 
```
This might required pyright package to work with, you could install it with the following command:
```shell
pip3 install pyright
```
### Enabling Golang support
```vim
Plug $HOME/.vim/config/golang.vim
```
N.B. You might also wanna install gotags, if you want the tags switch function as provided by ctags 
for C/C++.

### Tabular

Tabular is a simple plugin to enable easy text line up.

```vim
" Before
one = 1
two = 2
three = 3
four = 4

" After running `:Tab /=`
one   = 1
two   = 2
three = 3
four  = 4
```

