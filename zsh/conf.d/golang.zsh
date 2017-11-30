export GOPATH="$HOME/.go"

echo $PATH | grep -q "$GOPATH"
__reval=$?
if [[ $__reval != 0 ]]; then
  export PATH="${GOPATH}/bin:$PATH"
fi
