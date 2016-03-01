# dotfiles_mac
test

####pythonに関しての注意
- vimで`:python print sys.version`をしたものとコンソールで`python -c "import sys;print(sys.version)"`が違う場合はmarkdown等がうまく使えない場合があるので、vimをインストールし直したりするのがいい
- vimとpythonのbit幅が違うと動かないので確認する

####evervimのtoken
- ~/.vimrc_path_localを読むようにしているのでそこに`source ~/.vim/secret/`としてそこのファイルにevernoteのtokenをもたせるようにした
