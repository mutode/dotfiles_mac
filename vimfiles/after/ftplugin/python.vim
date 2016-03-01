setlocal smarttab
setlocal expandtab
setlocal shiftwidth=4
setlocal foldmethod=indent
setlocal commentstring=#%s
setlocal omnifunc=jedi#completions
setlocal completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
  endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
