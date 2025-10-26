set nocompatible

"set termguicolors " enable true colors support
if has('termguicolors')
	if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif
	set termguicolors
else
	set t_Co=256
endif


if has('syntax')
	syntax enable
	" The `:syntax enable` command will keep most of your current color settings.
	" This allows using `:highlight` commands to set your preferred colors before or
	" after using this command.  If you want Vim to overrule your settings with the
	" defaults, use: >
	" :syntax on
endif

if &shell =~# 'fish$'
	set shell=sh
endif



" Base setting
set autoindent

" C/C++ indent
set cindent
set bs=eol,start,indent
set mouse=a                     "Enable mouse mode
set autoread                    " Automatically reread changed files without asking me anything
set winaltkeys=no " disable Windows relate ALT
set nowrap
set ttimeout
set ttimeoutlen=50
set updatetime=100

set ruler

" smart cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
set nocursorcolumn           " speed up syntax highlighting

" search things
set ignorecase
set smartcase
set hlsearch
set incsearch

" encode
if has('multi_byte')
	set encoding=utf-8
	set fileencoding=utf-8

	" try encodings one by one.
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


" indent
if has('autocmd')
	filetype plugin indent on
endif


" other
set showmatch
set matchtime=3
set display=lastline
set wildmenu
set wildoptions+=pum,fuzzy
set wildmode=longest,full
set completeopt=menuone,noselect,popup
" set lazyredraw
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m
" tags things
set tags=./.tags;,.tags
set formatoptions+=m
set formatoptions+=B
set ffs=unix,dos,mac
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
" Some servers have issues with backup files, see #649
set nowritebackup
" increase max memory to show syntax highlighting for large files
set maxmempattern=20000
set scrolloff=8
" set sidescrolloff=5

" ~/.viminfo needs to be writable and readable. Set oldfiles to 1000 last
" recently opened files, :FzfHistory uses it
set viminfo='1000

" set shortmess, Vim default "filnxtToOS"
" set show search count
set shortmess-=S

if has('persistent_undo')
	set undofile
	set undodir=~/.cache/vim
	if !isdirectory(&undodir)
		silent! call mkdir(&undodir, 'p')
	endif
endif

" folding
if has('folding')
	set foldenable
	set fdm=indent
	set foldlevel=99
endif

