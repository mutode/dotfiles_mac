scriptencoding utf-8

" 気になるところ
"	omnisharpの初回インストール時のxbuildがうまく行ってなさそう
"	


" 最後にローカル用の設定があった場合はそちらを読み込む
if filereadable(expand('~/.vimrc_path_local'))
	source ~/.vimrc_path_local
endif

" neobundle設定
" neobundle path設定
if has('vim_starting')
	set nocompatible
	" runtimepathの追加(必須)
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vimの初期設定
call neobundle#begin(expand('~/.vim/bundle/'))
"let g:neobundle_default_git_protocol='https'

" neobundleを更新するための設定
NeoBundleFetch 'Shougo/neobundle.vim'

" 読み込むプラグイン
NeoBundle 'Shougo/unite.vim'

" 補完
NeoBundle 'Shougo/neocomplete.vim'

" c++の補完
" NeoBundle 'osyo-manga/vim-marching'

NeoBundleLazy 'Rip-Rip/clang_complete', {
			\ 'autoload' : {'filetypes' : ['cpp']}
			\ }

" C# 補完
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
			\ 'autoload': { 'filetypes': ['cs', 'csi', 'csx'] },
			\    'build': {
			\       'mac': 'xbuild server/OmniSharp.sln',
			\       'unix': 'xbuild server/OmniSharp.sln',
			\     },
			\ }
			" \ 'autoload': { 
			" \	'filetypes': ['cs', 'csi', 'csx']
			" \	}
			" \ }

" python 補完
NeoBundleLazy 'davidhalter/jedi-vim', {
			\ 'autoload': { 
			\	'filetypes': ['python']
			\	}
			\ }
" python sintastic
NeoBundle 'kevinw/pyflakes'
" python pep8 check
NeoBundle 'nvie/vim-flake8'

" C# シンタックスハイライト
NeoBundleLazy 'OrangeT/vim-csharp', {
			\ 'autoload': { 
			\	'filetypes': ['cs', 'csi', 'csx']
			\	}
			\ }

" シンタックスチェッカー
NeoBundle 'scrooloose/syntastic'

" omnisharp自動起動要
NeoBundle 'tpope/vim-dispatch'

" 非同期のためのvimproc
NeoBundle 'Shougo/vimproc.vim', {
			\	'build' : {
			\		'mac' : 'make -f make_mac.mak',
			\	},
			\}

" vimfiler
NeoBundle 'Shougo/vimfiler.vim'

"コメント挿入　C + --	
NeoBundle 'tomtom/tcomment_vim'

" ctagsを設定
NeoBundle 'szw/vim-tags'

"コンパイラ :QuickRun
NeoBundle 'thinca/vim-quickrun'

"インデントの深さを表示
NeoBundle 'Yggdroot/indentLine'

"powerlineの代わりにlightline
NeoBundle 'itchyny/lightline.vim'

" for MarkDown
NeoBundle 'kannokanno/previm'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tyru/open-browser.vim'

" evervim for Evernote
NeoBundle 'kakkyz81/evervim'

" カラーテーマ
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jpo/vim-railscasts-theme'

" エラー部分ハイライト
"NeoBundle 'jceb/vim-hier'

"キーマッピング
NeoBundle 'kana/vim-submode'

" Check install
NeoBundleCheck
call neobundle#end()
filetype plugin on 
filetype indent on 


" basic vimrc

scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,mac,dos
" font
" set guifontwide=Consolas
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" タブの画面上での幅
set tabstop=4
" Vimが挿入するインデントの幅
set shiftwidth=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 行番号を非表示 (nonumber:非表示)
set number
" ルーラーを表示 (ruler:表示)
set noruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
" tab:タブ, trail:行末空白, eol:改行, extends:折り返し
set listchars=tab:»_,trail:•,eol:↲,extends:»
" set listchars=tab:»•,trail:•,eol:↲,extends:»
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=1
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" undoファイルを無効化
set noundofile
" バックアップファイルを作成しない
" する場合はフォルダを指定した方がいい(ex set backupdir=C:/Temp)
set nobackup
" insertモードでも英語から始まるように
set iminsert=0
set imsearch=-1
" 検索時ハイライトを行わないように(逆 hlsearch)
set nohlsearch
" cursorline 行の強調表示
set cursorline 
" クリップボードにヤンクで反映されるように
set clipboard=unnamed,autoselect
" 改行時に自動コメントアウトを行わない
" こっちで定義しても意味がなさそう
" (ftpluginのほうに書かないと反映されない)
" setlocal formatoptions-=r
" setlocal formatoptions-=o
autocmd FileType * setlocal formatoptions -=ro



" neocomplete setting
let g:neocomplete#enable_at_startup = 1
let g:acp_enableAtStartup = 0

let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
			\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::' 

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

"----------------------------
"Unite.vim setting
"----------------------------
" 入力モードで開始すめる
let g:unite_enable_start_insert=1
nnoremap [unite] <Nop>
nmap <Space>u [unite]
" バッファ一覧
noremap <silent> [unite]u :<C-u>Unite<Space>file_rec<CR>
"noremap <silent> [unite]g :<C-u>Unite grep<CR>
noremap <silent> [unite]f :<C-u>Unite<Space>file source<CR>
noremap <silent> [unite]h :<C-u>Unite buffer<CR>

" ウィンドウをsplit して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦にvsplitして開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCkey & ESCkey to END
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" バッファを移動したときに
" 自動的にプロジェクトルートをカレントディレクトリにする
function! ChangeCurrentDirectoryToProjectRoot()
	let root = unite#util#path2project_directory(expand('%'))
	execute 'lcd' root
endfunction
:au BufEnter * :call ChangeCurrentDirectoryToProjectRoot()

" 大文字小文字を区別しない
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1

nnoremap <silent> [unite]g :<C-u>Unite grep: -buffer-name=search-buffer<CR><C-R>
" grep検索結果の再呼び出し
nnoremap <silent> [unite]r :<C-u>UniteResume search-buffer<CR>

" unite grepにag(the silver searcher)を使う
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
	let g:unite_source_grep_recursive_opt = ''
endif

"---------------------------------------
" lightline setting
"---------------------------------------
let g:lightline = {
			\ 'colorscheme': 'solarized',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\  'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', ]]
			\ },
			\ 'component_function': {
			\ 'modified': 'MyModified',
			\ 'readonly': 'MyReadonly',
			\ 'fugitive': 'MyFugitive',
			\ 'filename': 'MyFilename',
			\ 'fileformat': 'MyFileformat',
			\ 'filetype': 'MyFiletype',
			\ 'fileencoding': 'MyFileencoding',
			\ 'mode': 'MyMode'
			\ },
			\'component_expand': {
			\ 'syntastic': 'SyntasticStatuslineFlag'
			\ },
			\'component_type': {
			\ 'syntastic': 'error',
			\ }
			\}

function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '-RO-' : ''
endfunction

function! MyFilename()
	return('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\ &ft == 'unite' ? unite#get_status_string() :
				\ &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			return fugitive#head()
		endif

	catch
	endtry
	return ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? &fileformat: ''
endfunction

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : '' 
endfunction

function! MyFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.cs call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction

"-------------------------
" QucikRun設定
"-------------------------
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config.cpp={
			\ 'command': 'clang',
			\ 'cmdopt': '-std=c++11',
			\}

"-------------------------
" clang_complete Setting 
"-------------------------
" let g:clang_auto_select=0
let g:clang_complete_auto=1
let g:clang_periodic_quickfix=1
let g:clang_complete_copen=1
let g:clan_use_library=1
" let g:clang_library_path="/usr/local/Cellar/gcc/5.2.0/lib/gcc/5/"
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"

let g:clang_user_options = '-std=c++11'

"-------------------------
" marching Setting 
"-------------------------
" clang コマンドの設定
" let g:marching_clang_command = $VIM_CPP_CLANG 
" let g:marching_include_paths = [
" ¥   $VIM_CPP_STDLIB
" ¥]
" " オプションの追加、どのバージョンでするか
" let g:marching_clang_command_option='-std=c++14'
" " neocompleteを使う場合
" let g:marching_enable_neocomplete = 1
" " オムニ補完時に補完ワードを挿入したくない場合
" imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" key setting vimrc

" tagsが複数ある時は一覧表示
" nnoremap <C-]> g<C-]>
" tags一覧を選択後垂直割して表示
" nnoremap <C-]> :sts <CR>
" tags一覧を選択後別タブで表示

"-----------------------------
" keybind
"-----------------------------
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_
" nnoremap sw <C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sc :<C-u>tabclose<CR>
nnoremap sC :<C-u>tabonly<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
nnoremap <C-e> :VimFilerExplore -split -winwidth=50<Cr>
nnoremap <Space>e :lcd %:h<Cr>
nnoremap "p "0p
nnoremap p p

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

"-------------------------------------------
" カラースキーマの設定 
" neobundleを使っているのでotherに入れる
"-------------------------------------------
set t_Co=256
syntax on


"-------------------------
" indentLine Setting 
"-------------------------
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|'
"set list listchars=tab:\|-


"---------------------------------------
" syntastic
"---------------------------------------
 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0
 let g:syntastic_mode_map = { 'mode': 'active',
 	\ 'passive_filetypes': ['cs', 'python']}


 let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
 let g:syntastic_quiet_messages = {"level":"warnings"}


"---------------------------------------
" vimfiler
"---------------------------------------
" autocmd! FileType vimfiler call g:my_vimfiler_settings()
" function! g:my_vimfiler_settings()
"   nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("¥<Plug>(vimfiler_expand_tree)", "¥<Plug>(vimfiler_edit_file)")
"   nnoremap <buffer>s :call vimfiler#mappings#do_action('my_split')<Cr>
"   nnoremap <buffer>v :call vimfiler#mappings#do_action('my_vsplit')<Cr>
" endfunction
"
" let s:my_action = { 'is_selectable' : 1 }
" function! s:my_action.func(candidates)
"   wincmd p
"   exec 'split '. a:candidates[0].action__path
" endfunction
" call unite#custom_action('file', 'my_split', s:my_action)
"
" let s:my_action = { 'is_selectable' : 1 }                     
" function! s:my_action.func(candidates)
"   wincmd p
"   exec 'vsplit '. a:candidates[0].action__path
" endfunction
" call unite#custom_action('file', 'my_vsplit', s:my_action)




"-------------------------------------------
"PreVim
"-------------------------------------------
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:vim_markdown_folding_disabled=1



"-------------------------------------------
" ctagsの設定 
"-------------------------------------------
" 拡張子で読み込み設定を変える
" au BufNewFile,BufRead *.cs set tags+=$COMMON_HOME/cs.tags
set tags=./tags,tags;
if has('path_extra')
	set tags+=tags;
endif


"-------------------------------------------
" vim-tagsの設定 
"-------------------------------------------
au BufNewFile,BufRead *.cs let g:vim_tags_project_tags_command = "ctags -f C:¥User¥shoei.asama¥cs.tags 'pwd' 2>/dev/null &"

"-------------------------------------------
" evervim
"-------------------------------------------
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,eT :<C-u>EvervimListTags<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
nnoremap <silent> ,ec :<C-u>EvervimOpenClient<CR>
nnoremap ,es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <silent> ,et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
nnoremap <silent> ,eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done<CR>
