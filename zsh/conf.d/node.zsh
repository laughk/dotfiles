NODEBREW_PREFIX="${HOME}/.nodebrew"

[[ -d ${NODEBREW_PREFIX}/current/bin ]] && {
  PATH="${NODEBREW_PREFIX}/current/bin:$PATH"
}
