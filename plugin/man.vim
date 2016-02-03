if get(g:, 'loaded_man', 0)
  finish
endif
let g:loaded_man = 1

command! -complete=customlist,man#Complete -count=0 -nargs=+ Man call man#get_page(<count>, <f-args>)
