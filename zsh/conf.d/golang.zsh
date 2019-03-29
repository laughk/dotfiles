# Setup or Update goenv
if [[ ! -d ~/.goenv ]]; then
  git clone https://github.com/syndbg/goenv.git ~/.goenv
elif [[ ! -f /tmp/.goenv_updated ]]; then
  cd ~/.goenv
  git pull
  touch /tmp/.goenv_updated
  cd -
fi
export GOENV_ROOT="${HOME}/.goenv"
export PATH="${GOENV_ROOT}/bin:${PATH}"
eval "$(goenv init -)"

# Setup GOPATH
export GOPATH="$HOME/.go"
export PATH="${GOROOT}/bin:$PATH"
export PATH="${GOPATH}/bin:$PATH"
