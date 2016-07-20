#zsh補完
autoload -U compinit
compinit

#vimをis_luaに変更
export PATH=/bin:/usr/local/bin:/usr/bin:/usr/sbin
#gitをbrew gitに変更
export PATH="/usr/local/Cellar/git/2.9.0/bin:$PATH"
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

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

function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
            echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
            echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
            echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

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

#-----------------
# neovim
#-----------------
export XDG_CONFIG_HOME=~/.config
