	" OSC52 cp
	" With these mappings:
	" In normal mode, <leader>c is an operator that will copy the given text to the clipboard.
	" In normal mode, <leader>cc will copy the current line.
	" In visual mode, <leader>c will copy the current selection.
	nmap <leader><leader>c <Plug>OSCYankOperator
	nmap <leader><leader>cc <leader><leader>c_
	vmap <leader><leader>c <Plug>OSCYankVisual
