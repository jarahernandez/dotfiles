#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Function to get python venv name
get_venv() {
    if [ -n  "$VIRTUAL_ENV" ]; then
        echo " ($(basename "$VIRTUAL_ENV"))"
    fi
}

# Disable built-in prefix (python venv)
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompts
# Default:
# PS1='[\u@\h \W]\$ '

# Tests:
# PS1="\[\033[34m\]  \[\033[34m\]\W \[\033[0m\]"
# PS1="\[\033[0;36m\]\W \[\033[0;36m\]> \[\033[0m\]"
# PS1="\[\033[0;36m\]\W\[\033[0;36m\]\$(get_venv) > \[\033[0m\]"

# Arch blue:
PS1="\[\033[0;36m\]\W\$(get_venv) > \[\033[0m\]"
