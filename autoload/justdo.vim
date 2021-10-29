" =============================================================================
" File:          autoload/justdo.vim
" Description:   just do
" Author:        Steve Lemuel <wlemuel@hotmail.com>
" =============================================================================

if exists("g:autoloaded_justdo") || &cp || v:version < 700
  finish
endif

" This is basic vim plugin boilerplate
let s:save_cpo = &cpo
set cpo&vim

" Global Variables {{{

let g:justdo_silent = 1
let g:justdo_history_file = "~/.cache/vim-justdo.history"

" }}}

" Script Variables {{{

let s:command = ''

" }}}

fu! justdo#check_command() abort
  if empty(s:command)
    return 0
  else
    return 1
  endif
endf

fu! justdo#set_command() abort
  let curline = getline('.')
  call inputsave()
  let s:command = input('[vim-justdo] Enter command: ')
  call inputrestore()
  " call setline('.', curline . ' ' . name)
endf

fu! justdo#print_command() abort
  echo "[vim-justdo] '" . s:command . "'"
endf

fu! justdo#execute() abort
  if justdo#check_command()
    if g:justdo_silent
      silent exec "!" . s:command
    else
      exec "!" . s:command
    endif
  else
    call justdo#set_command()
  endif
endf

fu! justdo#clear_command() abort
  echo "[vim-justdo] clear '" . s:command . "'"
  let s:command = ''
endf

fu! justdo#save_history() abort
  let history_file = expand(g:justdo_history_file)
  if justdo#check_command()
    call writefile([s:command], history_file, "a")
    call system("gawk -i inplace '!seen[$0]++' " . history_file)
  else
    echo "[vim-justdo] the command is not set."
  endif
endf

fu! justdo#show_history() abort
  if filereadable(expand(g:justdo_history_file))
    let history = system("awk '!seen[$0]++' " . expand(g:justdo_history_file) . " | tail -n 20 | nl")
    echo "     [vim-justdo] - History\n\n" . history
  else
    echo "[vim-justdo] history does not exist."
  endif
endf

fu! justdo#toggle_silent() abort
  if g:justdo_silent
    let g:justdo_silent = 0
  else
    let g:justdo_silent = 1
  endif
endf

augroup JustDo
  autocmd!
  autocmd VimLeavePre * call justdo#save_history()
augroup END

let g:autoloaded_justdo = 1

" This is basic vim plugin boilerplate
let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ft=vim et sw=2:
