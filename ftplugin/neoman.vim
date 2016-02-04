if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

nnoremap <silent> <buffer> q :q<CR>
setlocal iskeyword+=\.,-,(,)
setlocal buftype=nofile noswapfile
setlocal bufhidden=hide
setlocal nobuflisted
setlocal nomodified
setlocal readonly
setlocal nomodifiable
setlocal number
setlocal noexpandtab
setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal nolist
setlocal foldcolumn=0
setlocal colorcolumn=0

if !exists("g:no_plugin_maps") && !exists("g:no_man_maps")
  nnoremap <silent> <buffer> <C-]>    :call neoman#get_page()<CR>
  nnoremap <silent> <buffer> <C-T>    :call neoman#pop_page()<CR>
  nnoremap <silent> <nowait><buffer>  q <C-W>c
  if &keywordprg !=# ':Man'
    nnoremap <silent> <buffer> K      :call neoman#get_page()<CR>
  endif
endif

let b:undo_ftplugin = 'setlocal iskeyword<'