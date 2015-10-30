scriptencoding utf-8

setlocal omnifunc=OmniSharp#Complete
setlocal formatoptions-=r
setlocal formatoptions-=o
setlocal tabstop=4

setlocal syntax=cs
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" OmniSharpを使ったジャンプ
nnoremap <silent> <buffer> <C-]> :vsp <CR> :OmniSharpGotoDefinition<CR>
" nnoremap <silent> <buffer> <S-C-]> :OmniSharpFindUsages<CR>
