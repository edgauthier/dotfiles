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

# Set up colored ls output
if command -v dircolors > /dev/null 2>&1; then
    # Linux with dircolors
    [ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)
    alias ls='ls -F --color=auto'
    alias l='ls -AlhF --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    export LSCOLORS="ExFxBxDxCxegedabagacad"
    alias l='ls -AlhFG'
    alias ls='ls -FG'
fi

umask 002

alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.ID}}"'
alias dpsp='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}"'

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

alias lg=lazygit
alias gds='find . -maxdepth 1 -type d | xargs -n 1 sh -c '\''cd "$0" && echo "$0" && git status 2>/dev/null'\'

#
# Disable flow control in terminal
stty -ixon
