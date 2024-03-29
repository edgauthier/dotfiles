PYTHONPATH=~/dev/python
export PYTHONPATH

if [[ -d /usr/local/git/bin ]]; then
    PATH=/usr/local/git/bin:$PATH
    export PATH
fi

PATH=/usr/local/bin:~/bin:~/dev/python:~/.local/bin:$PATH
export PATH

EDITOR=/usr/bin/vim
export EDITOR

WORKON_HOME=$HOME/.virtualenvs
export WORKON_HOME

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

alias l='ls -AlhF --color=auto'
alias ls='ls -F --color=auto'

# bash on the Mac doesn't use the same option for colored output
# Do the same for VSCode, which I only use on the Mac right now
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]] || [[ "$TERM_PROGRAM" == "vscode" ]] ; then
    alias l='ls -AlhFG'
    alias ls='ls -FG'
fi

umask 002

alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.ID}}"'

alias nbash='docker run -it --rm \
    --net=bridge \
    -u 1000:1000 \
    -p 8000:8000 \
    -v "$(pwd)":"/data" -w "/data" \
    -v "/srv/docker/node/npm-global":"/npm-global" \
    -e NPM_CONFIG_PREFIX=/npm-global \
    -e PATH=/npm-global/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    node bash'

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -f ~/.local_env.sh ]]; then
    source ~/.local_env.sh
fi

alias fd=fdfind
alias fzf="fzf --height=18 --layout=reverse --preview='head {}'"
alias vifz='vi $(fzf)'

# Disable flow control in terminal
stty -ixon
