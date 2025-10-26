"----------------------------------------------------------------------
" default is empty group
"----------------------------------------------------------------------
if !exists('g:bundle_enabled')
	let g:bundle_enabled = {}
endif

" check bundle is enabled
function! s:enableKey(key) 
	if has_key(g:bundle_enabled, a:key) && g:bundle_enabled[a:key]
		return 1
	else
		return 0
	endif
endfunction


"----------------------------------------------------------------------
" ~/.vim/bundles
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))


" simple use for ssh to server or local simple file edit
if s:enableKey('simple')
	Plug 'skywind3000/vim-auto-popmenu'
	Plug 'skywind3000/vim-dict'

	" enable this plugin for filetypes, '*' for all files.
	let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

	" source for dictionary, current or other loaded buffers, see ':help cpt'
	set cpt=.,k,w,b

	" don't select the first item.
	set completeopt=menu,menuone,noselect

	" suppress annoy messages.
	set shortmess+=c
endif


" basic
if s:enableKey('basic') 

	" for " regesiter
	Plug 'junegunn/vim-peekaboo'
	" vim-peekaboo
	let g:peekaboo_window = 'vert bo 40new'

	" for template
	Plug 'mattn/vim-sonictemplate'
	IncScript site/bundle/sonictemplate/sonictemplate.vim

	" skywind3000
	Plug 'skywind3000/vim-terminal-help'
	IncScript site/bundle/terminal-help.vim

	Plug 'skywind3000/vim-dict'
	" add additional dicts for complete word
	let g:vim_dict_dict = [
				\ '~/.vim/dict', 
				\ ]

	" tpope
	Plug 'tpope/vim-surround' " smart surround
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-unimpaired' " easy help for basemap

	" for copy
	Plug 'ojroques/vim-oscyank', {'branch': 'main'} " osc52 support
	IncScript site/bundle/oscyank.vim


	" for status line
	Plug 'itchyny/lightline.vim'
	let g:lightline = {}
	let g:lightline.colorscheme = 'one'

	" ==================== NerdTree ====================
	" On-demand loading: loaded when the specified command is executed
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'Xuyuanp/nerdtree-git-plugin'
	" For toggling
	noremap <silent><Leader>fe :NERDTreeToggle<cr>
	" let NERDTreeShowHidden=1
	" Exit Vim if NERDTree is the only window remaining in the only tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

endif


" task manager
if s:enableKey('asynctasks')
	Plug 'skywind3000/asyncrun.vim'
	Plug 'skywind3000/asynctasks.vim'
	IncScript site/bundle/asynctasks.vim
endif


" colors
if s:enableKey('colors')
	Plug 'ayu-theme/ayu-vim'
	Plug 'morhetz/gruvbox'
	Plug 'rhysd/vim-color-spring-night'

	if !has('nvim')
		Plug 'skywind3000/colors-from-neovim.vim'
	endif

	" handle colors
	Plug 'skywind3000/vim-color-patch'
	" Setup the patch search path:
	let g:cpatch_path = '~/.vim/colors/patch'

	IncScript site/bundle/colors.vim
endif

if s:enableKey('fzf')
	" ==================== FZF ====================
	" fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	" Initialize configuration dictionary
	let g:fzf_vim = {}
	let g:fzf_vim.command_prefix = 'Fzf'
	let g:fzf_layout = { 'down': '~30%' }
	let g:fzf_vim.preview_window = ['hidden,right,50%', 'ctrl-p']
	" Path completion with custom source command
	inoremap <expr> <c-x><c-f> fzf#vim#complete#path('find')
	inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

	" quick grep use RG
	nnoremap <leader>fg :FzfRG<CR>

	" quick search file and grep
	nnoremap <leader>ff :FzfFiles<CR>
endif

" view color in vim
if s:enableKey('color-tool')
	Plug 'ap/vim-css-color'
endif

" vim-lsp
if s:enableKey('lsp')
	" for complete
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'

	" for buffer
	Plug 'prabirshrestha/asyncomplete-buffer.vim'
	Plug 'mattn/vim-lsp-settings', { 'branch': 'master' }

	IncScript site/bundle/lsp.vim
endif


" CoC
if s:enableKey('coc')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	IncScript site/bundle/coc.vim
endif

" snippet
if s:enableKey('snippet') && s:enableKey('coc')
	Plug 'honza/vim-snippets'
	IncScript site/bundle/coc-snippet.vim
elseif s:enableKey('snippet') && s:enableKey('lsp')
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
	Plug 'honza/vim-snippets'
	IncScript site/bundle/lsp-snippet.vim
endif

if s:enableKey('ai')
	Plug 'Exafunction/windsurf.vim', { 'branch': 'main' }
	" add key map
	let g:codeium_disable_bindings = 1 
	let g:codeium_enabled = v:false
	inoremap <script><silent><nowait><expr> <C-t> codeium#Accept()
endif

if s:enableKey('opt') && !has('nvim') 
	" icons, Always load the vim-devicons as the very last one.
	Plug 'ryanoasis/vim-devicons'

	if has('gui') " for keyboard sound when press the button
		Plug 'vim/killersheep' " game by bram
	endif
endif


call plug#end()
