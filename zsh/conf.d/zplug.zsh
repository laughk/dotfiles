#! zsh

[[ ! -d ${HOME}/.zplug ]] && {
  git clone https://github.com/b4b4r07/zplug ~/.zplug
}

source ${HOME}/.zplug/zplug

zplug "plugins/git",       from:oh-my-zsh, if:"which git"
zplug "plugins/mercurial", from:oh-my-zsh, if:"which hg"
zplug "plugins/vagrant",   from:oh-my-zsh, if:"which vagrant"
zplug "plugins/ruby",      from:oh-my-zsh, if:"which ruby"
zplug "plugins/gem",       from:oh-my-zsh, if:"which gem"
zplug "plugins/bundler",   from:oh-my-zsh, if:"which bundle"
zplug "plugins/rbenv",     from:oh-my-zsh, if:"which rbenv"
zplug "plugins/python",    from:oh-my-zsh, if:"which python"
zplug "plugins/pip",       from:oh-my-zsh, if:"which pip"
zplug "plugins/npm",       from:oh-my-zsh, if:"which npm"
zplug "plugins/sudo",      from:oh-my-zsh
zplug "plugins/tumx",      from:oh-my-zsh, if:"which tmux"

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "themes/ys",         from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
