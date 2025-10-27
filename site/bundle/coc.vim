" Find extensions in https://www.npmjs.com/search?q=keywords%3Acoc.nvim

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" not use CocAction in codeAction CocAction will request and wait for a response. It's recommended to use CocActionAsync, check :h CocAction
" otherwise, codeAction maybe hangs
" See https://github.com/neoclide/coc.nvim/issues/5251
" codeAction in current cursor
nmap <silent><nowait> <leader>ca :call CocActionAsync('codeAction', 'cursor')<CR>
" inoremap <C-x><C-a> <C-o>:call CocActionAsync('codeAction', 'cursor')<CR>
inoremap <C-x><C-a> <Cmd>call CocActionAsync('codeAction', 'cursor')<CR>


" Use zK to show documentation in preview window, let k go to normal K
nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> zK :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)



" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif



augroup MyCoCEventGroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	autocmd BufWritePre *.go :silent! call CocAction('organizeImport')
	autocmd BufWritePre *.go :silent! call CocAction('format')
	autocmd BufWritePre *.c :silent! call CocActionAsync('organizeImport')
	autocmd BufWritePre *.c :silent! call CocActionAsync('format')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" snippet
" when using coc-snippets, we disanble ultisnips. https://github.com/neoclide/coc-snippets/issues/123
" coc-snippet coc-snippets doesn't calculate python code on placeholder change.
" disable ultisnips support by add "snippets.ultisnips.enable": false in your configuration file.
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space()  ? "\<TAB>" :
			\ coc#refresh()
" Snippet expansion and navigation for coc.nvim
" Use <Tab> to jump to next placeholder in snippet mode
let g:coc_snippet_next = '<Tab>'

" Use <S-Tab> to jump to previous placeholder in snippet mode
let g:coc_snippet_prev = '<S-Tab>'
