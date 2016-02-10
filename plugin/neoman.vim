if exists('g:loaded_neoman')
  finish
endif
let g:loaded_neoman = 1

command! -complete=customlist,neoman#Complete -nargs=* Neoman call neoman#get_page(<f-args>)
