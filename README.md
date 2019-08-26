# vim-justdo

Just execute same command repeatly in the convinent way.

## Requirements

- Vim 7.0+

## Installation

vim-justdo follows the standard runtime path structure. Below are some helper lines
for popular package managers:

-   [Vim 8 packages](http://vimhelp.appspot.com/repeat.txt.html#packages)  
    -   `git clone https://github.com/wlemuel/vim-justdo.git ~/.vim/pack/plugins/start/vim-justdo  

-   [Pathogen](https://github.com/tpope/vim-pathogen)  
    -   `git clone https://github.com/wlemuel/vim-justdo.git ~/.vim/bundle/vim-justdo`  

-   [vim-plug](https://github.com/junegunn/vim-plug)  
    -   `Plug 'wlemuel/vim-justdo'`  

-   [Vundle](https://github.com/VundleVim/Vundle.vim)  
    -   `Plugin 'wlemuel/vim-justdo'`  

## Basic Usage

-   Run `:JustDo` to execute command, otherwise asking for command.  

## Basic Options

- When to execute command silently, Default is 1:

    ```vim
    let g:justdo_silent = 0
    ```

## Basic KeyMapping

- Press <F5> to execute command:

    ```vim
    noremap <silent> <F5> :JustDo<CR>
    ```

## Appendix

I'd be glad to receive patches,
comments and your considered criticism.

_Have fun with vim-justdo!_

