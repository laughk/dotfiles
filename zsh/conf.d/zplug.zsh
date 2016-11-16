#! zsh

[[ ! -d ${HOME}/.zplug ]] && {
  git clone https://github.com/b4b4r07/zplug ~/.zplug
}

source ${HOME}/.zplug/init.zsh

zplug "plugins/git",       from:oh-my-zsh, nice:10, if:"which git"
zplug "plugins/mercurial", from:oh-my-zsh, if:"which hg"
zplug "plugins/vagrant",   from:oh-my-zsh
zplug "plugins/ruby",      from:oh-my-zsh
zplug "plugins/gem",       from:oh-my-zsh
zplug "plugins/bundler",   from:oh-my-zsh
zplug "plugins/rbenv",     from:oh-my-zsh
zplug "plugins/python",    from:oh-my-zsh
zplug "plugins/pip",       from:oh-my-zsh
zplug "plugins/npm",       from:oh-my-zsh, if:"which npm"
zplug "plugins/sudo",      from:oh-my-zsh
zplug "plugins/tumx",      from:oh-my-zsh, if:"which tmux"
zplug "plugins/github",    from:oh-my-zsh, if:"which hub"
zplug "mollifier/anyframe"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# theme
if [[ -f ~/.zshtheme ]] ; then
  source ~/.zshtheme
else
  zplug "themes/ys", from:oh-my-zsh
fi

# cli tool
zplug "stedolan/jq",      as:command, from:gh-r, frozen:1
zplug "motemen/ghq",      as:command, from:gh-r, rename-to:"ghq"
zplug "juneguun/fzf-bin", as:command, from:gh-r, rename-to:"fzf"
zplug "monochromegane/the_platinum_searcher", \
  as:command, from:gh-r, rename-to:"pt"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
