" use to show quickfix windows, if you not set, you need to use :copen command
let g:asyncrun_open = 15

" output use terminal
let g:asynctasks_term_pos = 'bottom'

" use rg to search cursor word
nnoremap <leader><leader>gw :AsyncRun rg -n <cword><CR>
