"======================================================================
"
" init.vim - initialize config
"
" My Setup Learn From skywind
"
"======================================================================

" simple
" let g:bundle_enabled = {'simple': 1 }

" set to 1 to enable, set to 0 to disable
let g:bundle_enabled = {
                        \'basic': 1,
                        \'git': 1,
                        \'colors': 1,
                        \'color-tool': 1,
                        \'lsp': 0,
                        \'coc': 1,
                        \'ai': 0,
                        \'fzf': 1,
                        \'tags': 0,
                        \'opt': 1,
                        \'asynctasks': 1
                        \}

"----------------------------------------------------------------------
" include script
"----------------------------------------------------------------------
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")
exec 'set rtp+='. fnameescape(s:home)
exec 'set rtp+=~/.vim'


"----------------------------------------------------------------------
" Load script
"----------------------------------------------------------------------
" Basic
IncScript init/basic.vim

" Config
IncScript init/config.vim

" Ignores some things
IncScript init/ignores.vim

" Load plug
IncScript init/plug.vim

" Load base style
IncScript init/style.vim

" Keymaps
IncScript init/keymaps.vim

" In some old vim version, if your alt key not work, InScript alt.vim
" IncScript init/alt.vim
