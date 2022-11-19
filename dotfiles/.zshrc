# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

#######################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# スペルミスを修正
setopt correct

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'
alias sl='ls'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias lamk='latexmk -pvc'

alias dc='docker-compose'

alias mkdir='mkdir -p'

alias be='bundle exec'
alias b='bundle'
alias br='bundle exec rails'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias kctl='kubectl'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'

alias vz='vim ~/.zshrc'
alias deb='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# git
alias g='git '
alias cmm=' commit -m '
alias ch=' checkout'
alias st=' status'
alias glog='git log --oneline --decorate --graph --branches --tags --remotes --all'



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

# vim:set ft=zsh:

# --------------------------------------
# Google search from terminal
# --------------------------------------
google(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.co.jp/search?q=${*// /+}"
    local app="/Applications"
    local c="${app}/Google Chrome.app"
    local f="${app}/Firefox.app"
    local s="${app}/Safari.app"
    case ${opt} in
        "-c")   open "${url}" -a "$c";;
        "-f")   open "${url}" -a "$f";;
        "-s")   open "${url}" -a "$s";;
        *)      open "${url}";;
    esac
}

#slackを開く
slack(){
  open -a "/Applications/Slack.app"
}

line(){
  open -a "/Applications/Line.app"
}

#cdpでcdで行きたいディレクトリに適当な検索で行くことができるようになる
alias cdp='cd "$(find . -type d | grep -v "\/\." | peco)"'

#C-rでコマンド履歴を開いてpecoで選ぶ
function peco-select-history() {
    # historyを番号なし、逆順、最初から表示。
    # 順番を保持して重複を削除。
    # カーソルの左側の文字列をクエリにしてpecoを起動
    # \nを改行に変換
    BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
    CURSOR=$#BUFFER             # カーソルを文末に移動
    zle -R -c                   # refresh
}
zle -N peco-select-history
bindkey '^R' peco-select-history

#pecoでsshをするための前座
function _get_hosts() {
    # historyを番号なし、逆順、ssh*にマッチするものを1番目から表示
    # 最後の項をhost名と仮定してhost部分を取り出す
    local hosts
    ssh_hist="$(history -nrm 'ssh*' 1 | \grep 'ssh ')"
    hosts="$(echo $ssh_hist | perl -pe 's/ssh(\s+-([1246AaCfGgKkMNnqsTtVvXxYy]|[^1246AaCfGgKkMNnqsTtVvXxYy]\s+\S+))*\s+(\S+@)?//' | cut -d' ' -f1)"
    #                                        -----------------------------------------------------------------------   -------
    #                                                        hostnameよりも前にあるオプション                          user@     を削除
    # know_hostsからもホスト名を取り出す
    # portを指定したり、ip指定でsshしていると
    #   [hoge.com]:2222,[\d{3}.\d{3].\d{3}.\d{3}]:2222
    # といったものもあるのでそれにも対応している
    hosts="$hosts\n$(cut -d' ' -f1  ~/.ssh/known_hosts | tr -d '[]' | tr ',' '\n' | cut -d: -f1)"
    hosts=$(echo $hosts | awk '!a[$0]++')
    echo $hosts
}

#上の_get_hostsを使ってインクリメンタルサーチでsshを行う
function peco-ssh() {
    hosts=`_get_hosts`
    local selected_host=$(echo $hosts | peco --prompt="ssh >" --query "$LBUFFER")
    if [ -n "$selected_host" ]; then
        BUFFER="ssh ${selected_host}"
        zle accept-line
    fi
}
zle -N peco-ssh
bindkey '^[s' peco-ssh

#pecoで探してvimで開く
function peco-dir-open-app () {
    find . | peco | xargs sh -c 'vim "$0" < /dev/tty'
    zle clear-screen
}
zle -N peco-dir-open-app
bindkey '^xt' peco-dir-open-app     # C-x t
alias vp='peco-dir-open-app'

# pwdが変わった時に発火してls
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls
    fi
}
