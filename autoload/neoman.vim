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
endfunction

function! neoman#Complete(ArgLead, CmdLine, CursorPos)
endfunction
