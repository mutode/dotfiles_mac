#zsh補完
autoload -U compinit
compinit

#vimをis_luaに変更
export PATH=/bin:/usr/local/bin:/usr/bin

#
# Your previous /Users/shoei/.bash_profile file was backed up as /Users/shoei/.bash_profile.macports-saved_2014-10-22_at_10:46:16
##

# MacPorts Installer addition on 2014-10-22_at_10:46:16: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


#-----------------
# Setting
#-----------------
#ビープ音を消す
setopt no_beep
setopt nolistbeep
# language
export LANG=ja_JP.UTF-8
#コマンド訂正
setopt correct
#移動したディレクトリを記録しておく
#"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd
#ディレクトリ名を入力するだけで移動
setopt auto_cd
#補完候補を詰めて表示
setopt list_packed
#Emacsライクキーバインド
bindkey -e
#color変更
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -G"
# 補完 大文字小文字区別なし
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#-----------------
# プロンプトの設定 はエスケープ記号
#-----------------
case ${UID} in
	0)
	PROMPT="%{[31m%}%n%%%{[m%} "
	RPROMPT="[%~]"
	PROMPT2="%B%{[31m%}%_#%{[m%}%b "
	SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
	;;
	*)
	PROMPT="%{[31m%}%n%%%{[m%} "
	RPROMPT="[%~]"
	PROMPT2="%{[31m%}%_%%%{[m%} "
	SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
	;;
esac


#-----------------
#コマンド履歴
#-----------------
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

#-----------------
#コマンド履歴検索
#-----------------
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


#-----------------
# tmux 自動起動設定
#-----------------
# if [ -z "$TMUX" -a -z "$STY" ]; then
#     #tmuxxがなぜかうまく起動しない&tmuxxじゃなくても、reattach-to-user-namespaceを使えたのでよしとする
#     # if type tmuxx >/dev/null 2>&1; then
#     #     tmuxx
#     # elif type tmux >/dev/null 2>&1; then
#         if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
#             tmux attach && echo "tmux attached session "
#         else
#             tmux new-session && echo "tmux created new session"
#         fi
#     if type screen >/dev/null 2>&1; then
#         screen -rx || screen -D -RR
#     fi
# fi

#-----------------
#cocos2dx setting
#-----------------
# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Applications/cocos2dx/cocos2d-x-3.3/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Applications/cocos2dx/cocos2d-x-3.3
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Applications/cocos2dx/cocos2d-x-3.3/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Applications/AndroidDev/ndk-r10d
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Applications/AndroidDev/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.4/libexec/bin
export PATH=$ANT_ROOT:$PATH
