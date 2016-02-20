#! zsh

## tmux + SSH
# --------------------------------------------------------
function ssh_tmux() {

  tmux set-option default-terminal "screen" \; \
       new-window -n $(echo $@ | perl -ple 's/(^|\s)-[^\s] *[^\s]+//g' | cut -d" " -f2 ) "exec ssh $(echo $@)" \; \
       run-shell        "[[ ! -d ${HOME}/.tmuxlog/#W/$(date +%Y-%m/%d) ]] && mkdir -p ${HOME}/.tmuxlog/#W/$(date +%Y-%m/%d)" \; \
       pipe-pane        "cat >> ${HOME}/.tmuxlog/#W/$(date +%Y-%m/%d/%H%M%S.log)" \; \
       display-message  "Started logging to ${HOME}/.tmuxlog/#W/$(date +%Y-%m/%d/%H%M%S.log)"

}

if [[ ${TERM} = screen ]] ||  [[ ${TERM} = screen-256color ]] ; then
  compdef ssh_tmux=ssh
  alias ssh=ssh_tmux
fi

