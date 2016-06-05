zstyle ":anyframe:selector:" use fzf
zstyle ":anyframe:selector:fzf:" command 'fzf --extended'

## 移動したことのあるディレクトリへ移動
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
bindkey '^xd' anyframe-widget-cdr

## history 操作
### そのまま実行する
bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history
### 表示のみ
bindkey '^xi' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history

### プロセスをkillする
bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

## ghq管理リポジトリ
bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

## git ブランチ操作
bindkey '^xb' anyframe-widget-insert-git-branch
bindkey '^x^b' anyframe-widget-checkout-git-branch
