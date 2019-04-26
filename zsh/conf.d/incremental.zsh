zstyle ":anyframe:selector:" use fzf

INCREMENTAL_COMMAND_OPT=' --no-sort'
if [[ $TERM =~ screen.* ]] ; then
  INCREMENTAL_COMMAND=fzf-tmux
else
  INCREMENTAL_COMMAND=fzf
fi

zstyle ":anyframe:selector:fzf:" \
  command "$INCREMENTAL_COMMAND $INCREMENTAL_COMMAND_OPT"

## 移動したことのあるディレクトリへ移動
# ----------------------------------------------
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
bindkey '^xd' anyframe-widget-cdr

## history 操作
# ---------------------------------------------
### そのまま実行する
bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history
### 表示のみ
bindkey '^r' anyframe-widget-put-history

## プロセスをkillする
# ---------------------------------------------
bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

## ghq管理リポジトリ
# ---------------------------------------------
bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

## git ブランチ操作
# ---------------------------------------------
bindkey '^xb' anyframe-widget-insert-git-branch
bindkey '^x^b' anyframe-widget-checkout-git-branch

## git リポジトリ内のディレクトリ移動
function __goto_dir_in_git_repository() {
  git ls-files | awk -F/ '{$NF = ""; print $0}' | sed 's; ;/;g' | sort | uniq \
    | $INCREMENTAL_COMMAND \
    | anyframe-action-execute cd --
}
zle -N __goto_dir_in_git_repository
bindkey '^x^f' __goto_dir_in_git_repository

## GOPATH 配下のリポジトリに移動
function __goto_go_directory() {
  \ls -d ${GOPATH}/src/github.com/*/*(N-/) \
    | $INCREMENTAL_COMMAND  \
    | anyframe-action-execute cd --
}
zle -N __goto_go_directory
bindkey '^x^p' __goto_go_directory


## ssh-add
# -----------------------------------------------
function __put_ssh_add() {

  ls -1 ~/.ssh/pem.d/*.pem |
    anyframe-selector-auto |
    anyframe-action-put ssh-add

}

zle -N __put_ssh_add
bindkey '^x^i' __put_ssh_add

# pet
# ------------------------------------------------
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^x^s' pet-select
