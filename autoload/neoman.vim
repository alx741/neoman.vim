function! neoman#Open(...)
	let l:term = 0
	if exists("a:3")
		let l:term = 1
	endif
	if man#get_page(a:1, a:2)
		if l:term
			silent !nvr --remote-send "i"
		endif
		return
	endif
	setlocal nomodified
	setlocal filetype=man
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
	noremap q :q<CR>
endfunction

function! neoman#Complete(ArgLead, CmdLine, CursorPos)
endfunction
