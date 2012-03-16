PS1='[\e[1m\u@\h\e[m \W$(__git_ps1 " (%s)")]\$ '

alias l='ls -AlhF --color=auto'
alias ls='ls -F --color=auto'

# bash on the Mac doesn't use the same option for colored output
if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
    alias l='ls -AlhFG'
    alias ls='ls -FG'
fi

umask 002

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]
then
    . /usr/local/git/contrib/completion/git-completion.bash
fi

if [ -f /etc/bash_completion.d/git ]
then
    . /etc/bash_completion.d/git
fi

