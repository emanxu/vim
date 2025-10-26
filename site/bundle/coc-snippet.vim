" Snippet expansion and navigation for coc.nvim

" Use <Tab> to jump to next placeholder in snippet mode
let g:coc_snippet_next = '<Tab>'

" Use <S-Tab> to jump to previous placeholder in snippet mode
let g:coc_snippet_prev = '<S-Tab>'

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x <Plug>(coc-convert-snippet)
