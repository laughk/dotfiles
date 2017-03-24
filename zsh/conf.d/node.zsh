#NODEBREW_PREFIX="${HOME}/.nodebrew"
#
#[[ -d ${NODEBREW_PREFIX}/current/bin ]] && {
#  PATH="${NODEBREW_PREFIX}/current/bin:$PATH"
#}

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && {{
    source "$NVM_DIR/nvm.sh"  # This loads nvm
}}
