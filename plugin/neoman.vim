command! -count=0 -complete=customlist,neoman#Complete -nargs=+ Neoman call neoman#Open(<count>, <f-args>)
