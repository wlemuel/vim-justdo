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

let g:autoloaded_justdo = 1

" This is basic vim plugin boilerplate
let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ft=vim et sw=2:
