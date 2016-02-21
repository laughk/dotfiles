#! zsh

[[ -f ${HOME}/.pythonstartup.py ]] && {
  export PYTHONSTARTUP=${HOME}/.pythonstartup.py
}

if which virtualenvwrapper.sh > /dev/null 2>&1 ; then
  export WORKON_HOME=${HOME}/.virtualenvs
  source $(which virtualenvwrapper.sh)
fi
