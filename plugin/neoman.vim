if exists('g:loaded_neoman')
  finish
endif
let g:loaded_neoman = 1

if !exists("g:neoman_current_window")
  let g:neoman_current_window = 0
endif

command! -bang -complete=customlist,neoman#Complete -nargs=* Neoman call neoman#get_page(<bang>0, <f-args>)
