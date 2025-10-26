vim9script

set noexpandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

def Help(args: string)
  var syn_name = synIDattr(synID(line('.'), col('.'), 1), 'name')

  if syn_name =~# 'vimCommand'
    execute $'help {args}: '
  elseif syn_name =~# 'vimOption'
    execute $"help '{args}'"
  elseif syn_name =~# 'vimFunc'
    execute $'help {args}()'
  else
    execute $'help {args}'
  endif
enddef

command! -buffer -nargs=1 Help Help(<f-args>)
setlocal keywordprg=:Help
