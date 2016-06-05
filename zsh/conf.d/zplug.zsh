#! zsh

[[ ! -d ${HOME}/.zplug ]] && {
  git clone https://github.com/b4b4r07/zplug ~/.zplug
}

source ${HOME}/.zplug/zplug

zplug "b4b4r07/zplug"
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

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
