" default keymap
" - ALT + =: toggle terminal below.
" - ALT + SHIFT + h: move to the window on the left.
" - ALT + SHIFT + l: move to the window on the right.
" - ALT + SHIFT + j: move to the window below.
" - ALT + SHIFT + k: move to the window above.
" - ALT + SHIFT + p: move to the previous window.
" - ALT + -: paste register 0 to terminal.
" - ALT + q: switch to terminal normal mode.

" edit file
" drop abc.txt

" send command to terminal
" g:H {shell command}

" set to term to kill term session when exiting vim.
" kill all term session when exiting vim.
" see terminal.txt calling job_stop(job, "kill")
let g:terminal_kill = 'kill' 
" let g:terminal_kill = 'term' " only kill when process finished. 
" set to 1 to close window if process finished.
let g:terminal_close = 1

let g:terminal_height = 15
