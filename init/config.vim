" auto go to last edit
autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\	 exe "normal! g`\"" |
			\ endif

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup InitFileTypesGroup
	au!

	" C/C++ use // as comment
	au FileType c,cpp setlocal commentstring=//\ %s

	" markdown
	au FileType markdown setlocal wrap

	" quickfix
	au FileType qf setlocal nonumber
augroup END
