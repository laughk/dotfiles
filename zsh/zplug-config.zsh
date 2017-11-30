#! zsh

[[ ! -d ${HOME}/.zplug ]] && {
  ## install zplug
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
}

source ${HOME}/.zplug/init.zsh

# Third Party Plugins
# --------------------------------------------------------------------
zplug "plugins/vagrant",   from:oh-my-zsh, if:"which vagrant"
zplug "plugins/npm",       from:oh-my-zsh, if:"which npm"
zplug "plugins/sudo",      from:oh-my-zsh
zplug "plugins/tumx",      from:oh-my-zsh, if:"which tmux"
zplug "mollifier/anyframe"
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# cli tool
# --------------------------------------------------------------------
zplug "stedolan/jq",      as:command, from:gh-r, frozen:1
zplug "motemen/ghq",      as:command, from:gh-r, rename-to:"ghq"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", use:"*linux_amd64*"
zplug "junegunn/fzf",     as:command, use:"bin/fzf-tmux"
zplug "mackerelio/mkr",   as:command, from:gh-r, rename-to:"mkr", use:"*linux_amd64*"
zplug "monochromegane/the_platinum_searcher", \
  as:command, from:gh-r, rename-to:"pt"
zplug "motemen/2b0656be9e2acf32b35d", \
  as:command, from:gist, use:"mkr-hosts-tsv"
zplug "ReSTARTR/ec2-ls-hosts", as:command, from:gh-r, \
  rename-to:"ec2-ls-hosts", use:"*linux-amd64*"
zplug "kohkimakimoto/essh", as:command, from:gh-r, rename-to:"essh", use:"*linux_amd64*"

# theme
# --------------------------------------------------------------------
if [[ -f ~/.zshtheme ]] ; then
  source ~/.zshtheme
else
  zplug "themes/ys", from:oh-my-zsh
fi

# Install plugins if there are plugins that have not been installed
# -------------------------------------------------------------------
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi


# Then, source plugins and add commands to $PATH
zplug load --verbose
