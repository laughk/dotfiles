#! zsh

# Plugin
# ----------------------------------------
zinit load mollifier/anyframe
zinit load zsh-users/zsh-syntax-highlighting

# CLI
# ----------------------------------------
zinit ice as"program" from"gh-r" bpick"*linux64" mv"jq-* -> jq"
zinit load stedolan/jq

zinit ice as"program" from"gh-r" bpick"*linux_amd64*" pick"*/ghq"
zinit load x-motemen/ghq

zinit ice as"program" from"gh-r" bpick"*linux_amd64*"
zinit load junegunn/fzf-bin 

zinit ice as"program" from"gh-r" bpick"*linux_amd64*" pick"*/pt"
zinit load monochromegane/the_platinum_searcher

zinit ice as"program" from"gh-r" bpick"*linux_amd64*" pick"*/trdsql"
zinit load noborus/trdsql

zinit ice as"program" from"github" pick"bin/fzf-tmux"
zinit load junegunn/fzf 

# Theme
# ----------------------------------------
# for using theme by oh-my-zsh {{{
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit cdclear -q 
setopt promptsubst
# }}}

zinit snippet https://raw.githubusercontent.com/caiogondim/bullet-train.zsh/master/bullet-train.zsh-theme
export BULLETTRAIN_DIR_FG=black
export BULLETTRAIN_GO_FG=black
export BULLETTRAIN_VIRTUALENV_FG=black
