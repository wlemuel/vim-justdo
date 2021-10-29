" =============================================================================
" File:          plugin/justdo.vim
" Description:   just do
" Author:        Steve Lemuel <wlemuel@hotmail.com>
" =============================================================================

if exists("g:loaded_justdo") || &cp || v:version < 700
  finish
endif

" This is basic vim plugin boilerplate
let s:save_cpo = &cpo
set cpo&vim

" Main Content
command! -nargs=0 JustDo        call justdo#execute()
command! -nargs=0 JustDoSet     call justdo#set_command()
command! -nargs=0 JustDoClear   call justdo#clear_command()
command! -nargs=0 JustDoPrint   call justdo#print_command()
command! -nargs=0 JustDoHistory call justdo#show_history()
command! -nargs=0 JustDoToggleSilent call justdo#toggle_silent()

let g:loaded_justdo = 1

" This is basic vim plugin boilerplate
let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ft=vim et sw=2:
