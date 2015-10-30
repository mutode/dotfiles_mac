scriptencoding utf-8
" インクルードディレクトリのパスを設定
" ここはpathを見て変える
setlocal path+=$VIM_CPP_STDLIB

" タブ文字の長さ
setlocal tabstop=4
setlocal shiftwidth=4

" 空白文字を使用
setlocal expandtab


" 最後にローカル用の設定があった場合はそちらを読み込む
if filereadable(expand('$COMMON_HOME/.vim /cpp_local.vim'))
	source $COMMON_HOME/.vim/cpp_local.vim
endif
