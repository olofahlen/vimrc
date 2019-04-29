#!/bin/sh

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"  # CDs to location of the script

if [[ "$OSTYPE" == "msys" ]]; then  # Install as system-config for Windows
    echo 'set runtimepath+=$VIM/.vim_runtime

source $VIM/.vim_runtime/vimrcs/basic.vim
source $VIM/.vim_runtime/vimrcs/filetypes.vim
source $VIM/.vim_runtime/vimrcs/plugins_config.vim
source $VIM/.vim_runtime/vimrcs/extended.vim

try
source $VIM/.vim_runtime/my_configs.vim
catch
endtry' > ../.vimrc

    echo "Installed the Ultimate Vim configuration as system config. Enjoy :-)"
else
    echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

    echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
fi
