function! s:get_current_function_name() abort
	let l:line = getline('.')

	" check match
	" func (x xxxx) yyyyy () ([]byte, error) {
	" func yyyyy() ([]byte, error) {
	let l:match = matchlist(l:line, '\v^\s*func(\s*\(\w+\s+\w+\))?\s+(\w+)\s*\(')

	if len(l:match) > 2
		let l:func_name = l:match[2]
		echo "Function name: " . l:func_name
	else
		echo "No valid function detected!"
	endif

	return l:func_name

endfunction

function! s:run_go_test() abort
	" get abs path
	let l:filepath = expand('%:p')

	let l:func_name = s:get_current_function_name()

	if l:func_name == ''
		echo "No valid function detected on the current line!"
		return
	endif

	let l:cmd = printf('go test -v -run "^%s$" %s', l:func_name, l:filepath)

	echo "Running command: " . l:cmd

	execute 'botright terminal ' . l:cmd

    nnoremap <buffer> q :bd!<CR>

    setlocal bufhidden=wipe
    setlocal noswapfile
    " setlocal nobuflisted
    " setlocal readonly
	setlocal nonumber

endfunction

command! -nargs=0 GoTest call s:run_go_test()

nnoremap <silent> <F10> <CMD>call <SID>run_go_test()<CR>


