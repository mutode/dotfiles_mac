if exists('b:did_ftplugin_python')
	finish
endif

let b:did_ftplugin_python = 1

setlocal smarttab
setlocal expandtab
setlocal shiftwidth=4
setlocal foldmethod=indent
setlocal commentstring=#%s

setlocal omnifunc=jedi#completions
