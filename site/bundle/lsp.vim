" " for debug log info
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

let g:lsp_use_lua = has('nvim-0.4.0') || (has('lua') && has('patch-8.2.0775'))

let g:lsp_use_native_client = 1

let g:lsp_inlay_hints_enabled = 0
" highlight lspInlayHintsType ctermfg=8 guifg=#808080 ctermbg=NONE guibg=NONE
" highlight lspInlayHintsParameter ctermfg=8 guifg=#808080 ctermbg=NONE guibg=NONE

let g:lsp_semantic_enabled= 0
" use this can check the semantic is enable or not
" echo lsp#internal#semantic#is_enabled()

let g:lsp_format_sync_timeout = 1000
"disable folding globally
" let g:lsp_fold_enabled = 0
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 0
let g:lsp_diagnostics_float_delay = 500



" use C-n and C-p, let's Tap use to jump vsnip or pre
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" force refresh
imap <c-space> <Plug>(asyncomplete_force_refresh)

" setup map
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nmap <buffer> <leader>ca <plug>(lsp-code-action-float)
	inoremap <buffer> <C-x><C-a> <Cmd>execute 'normal <leader>ca'<CR>
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-b> lsp#scroll(-4)
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" for golang
autocmd BufWritePre *.go,*.c
			\ call execute('LspDocumentFormatSync') |
			\ call execute('LspCodeActionSync source.organizeImports')



" https://github.com/prabirshrestha/vim-lsp/issues/1297
" some ColorScheme not support vim-lsp, use this function to setup highlight
function! s:setup_semantic_highlights()
	hi link LspSemanticKeyword Keyword
	hi link LspSemanticNamespace Include
	hi link LspSemanticFunction Function
	hi link LspSemanticDefinitionSignatureFunction Function
	hi link LspSemanticSignatureFunction Function
	hi link LspSemanticDefaultLibraryFunction Function
	hi link LspSemanticMethod Function
	hi link LspSemanticSignatureMethod Function
	hi link LspSemanticDefinitionSignatureMethod Function
	hi link LspSemanticVariable Identifier
	hi link LspSemanticDefinitionInterfaceVariable Identifier
	hi link LspSemanticDefinitionSignatureVariable Identifier
	hi link LspSemanticInterfaceVariable Identifier
	hi link LspSemanticSignatureVariable Identifier
	hi link LspSemanticDefinitionSliceVariable Identifier
	hi link LspSemanticDefinitionPointerVariable Identifier
	hi link LspSemanticStructVariable Identifier
	hi link LspSemanticStringVariable Identifier
	hi link LspSemanticSliceVariable Identifier
	hi link LspSemanticDefaultLibraryReadonlyVariable Constant
	hi link LspSemanticPointerVariable Identifier
	hi link LspSemanticNumberVariable Number
	hi link LspSemanticDefinitionStructVariable Identifier
	hi link LspSemanticNumberReadonlyVariable Constant
	hi link LspSemanticOperator Operator
	hi link LspSemanticType Type
	hi link LspSemanticSignatureType Type
	hi link LspSemanticStructType Type
	hi link LspSemanticInterfaceType Type
	hi link LspSemanticDefaultLibraryInterfaceType Type
	hi link LspSemanticDefaultLibraryStringType Type
	hi link LspSemanticDefinitionStructType Type
	hi link LspSemanticNumber Number
	hi link LspSemanticString String
	hi link LspSemanticParameter Identifier
	hi link LspSemanticDefinitionInterfaceParameter Identifier
	hi link LspSemanticDefinitionPointerParameter Identifier
	hi link LspSemanticPointerParameter Identifier
	hi link LspSemanticInterfaceParameter Identifier
	hi link LspReference CursorColumn
	hi link LspErrorHighlight Error
	hi link LspWarningHighlight Todo
	hi link LspInformationHighlight Normal
	hi link LspHintHighlight Normal
	hi link LspErrorText Error
	hi link LspWarningText Todo
	hi link LspInformationText Normal
	hi link LspHintText Normal
	hi link LspErrorLine cleared
	hi link LspWarningLine cleared
	hi link LspInformationLine cleared
	hi link LspHintLine cleared
	hi link LspErrorVirtualText LspErrorText
	hi link LspWarningVirtualText LspWarningText
	hi link LspInformationVirtualText LspInformationText
	hi link LspHintVirtualText LspHintText
	hi link LspCodeActionText Normal
	hi link LspCodeActionLine cleared
endfunction


command! SetLspSemanticHighlight call s:setup_semantic_highlights()
