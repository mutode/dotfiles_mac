scriptencoding utf-8

" タブ文字の長さ
setlocal tabstop=4
setlocal shiftwidth=4

" 空白文字を使用
setlocal expandtab


" 最後にローカル用の設定があった場合はそちらを読み込む
if filereadable(expand('$COMMON_HOME/.vim /cpp_local.vim'))
	source $COMMON_HOME/.vim/cpp_local.vim
endif
