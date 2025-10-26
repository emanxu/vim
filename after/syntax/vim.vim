if exists("b:current_syntax")
	finish
endif

syntax keyword vimIncScript IncScript
highlight def link vimIncScript Function

let b:current_syntax = "vim"
