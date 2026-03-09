#! zsh

# Plugin
# ----------------------------------------
zinit load mollifier/anyframe
zinit load zsh-users/zsh-syntax-highlighting

export GPG_TTY=$TTY
zinit ice depth=1; zinit light romkatv/powerlevel10k 

# CLI
# ----------------------------------------
# For WSL2 clipboard ( Win11 ではなぜか動いてくれないので一旦コメントアウト)
#if uname -a | grep -q microsoft ; then
#  zinit ice as"program" from"gh-r" bpick"*x64*" pick"win32yank.exe"
#  zinit load equalsraf/win32yank 
#fi

# Theme
# ----------------------------------------
# # for using theme by oh-my-zsh {{{
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
# # git.plugin.zsh の非同期版 git_prompt_info を同期版で上書き
# git_prompt_info() {
#   local ref
#   if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
#     ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
#     ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
#     echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
#   fi
# }
# zinit cdclear -q 
# #zinit snippet OMZ::themes/ys.zsh-theme
# setopt promptsubst
# # }}}
# 
# zinit snippet https://raw.githubusercontent.com/caiogondim/bullet-train.zsh/master/bullet-train.zsh-theme
# export BULLETTRAIN_DIR_FG=black
# export BULLETTRAIN_GO_FG=black
# export BULLETTRAIN_VIRTUALENV_FG=black
