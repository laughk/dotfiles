#! zsh

# use direnv
if type direnv > /dev/null 2>&1 ; then 
  eval "$(direnv hook zsh)"
fi

# use tfenv
[[ -f ${HOME}/.tfenv/bin/tfenv ]] && {
  export PATH="${HOME}/.tfenv/bin:${PATH}"
}

# git-wt
if type git-wt > /dev/null 2>&1 ; then
  eval "$(git wt --init zsh --nocd)"
fi
