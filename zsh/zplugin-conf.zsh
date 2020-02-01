#! zsh

# Plugin
# ----------------------------------------
zplugin load mollifier/anyframe
zplugin load zsh-users/zsh-syntax-highlighting

# CLI
# ----------------------------------------
zplugin ice as"program" from"gh-r" bpick"*linux64" mv"jq-* -> jq"
zplugin load stedolan/jq

zplugin ice as"program" from"gh-r" bpick"*linux_amd64*" pick"*/ghq"
zplugin load motemen/ghq

zplugin ice as"program" from"gh-r" bpick"*linux_amd64*"
zplugin load junegunn/fzf-bin 

zplugin ice as"program" from"gh-r" bpick"*linux_amd64*" pick"*/pt"
zplugin load monochromegane/the_platinum_searcher

zplugin ice as"program" from"gh-r" bpick"*linux_amd64*" pick"*/trdsql"
zplugin load noborus/trdsql

zplugin ice as"program" from"github" pick"bin/fzf-tmux"
zplugin load junegunn/fzf 

# Theme
# ----------------------------------------
# for using theme by oh-my-zsh {{{
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin cdclear -q 
setopt promptsubst
# }}}

zplugin snippet https://raw.githubusercontent.com/caiogondim/bullet-train.zsh/master/bullet-train.zsh-theme
export BULLETTRAIN_DIR_FG=black
export BULLETTRAIN_GO_FG=black
