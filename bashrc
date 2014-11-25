PS1='[\e[1m\u@\h\e[m \W]\$ '
GIT_PROMPT=0 # assume we don't have git-prompt loaded

if [ -f ~/.profile ]; then
    . ~/.profile
fi

if [ -f /etc/bash_completion ]
then 
    . /etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion ]
then 
    . /usr/local/etc/bash_completion
fi

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]
then
    . /usr/local/git/contrib/completion/git-completion.bash
fi

if [ -f /etc/bash_completion.d/git ]
then
    . /etc/bash_completion.d/git
fi

if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]
then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
    GIT_PROMPT=1
fi

if [ -f /etc/bash_completion.d/git-prompt ]
then
    . /etc/bash_completion.d/git-prompt
    GIT_PROMPT=1
fi

if [ -f /usr/local/git/contrib/completion/git-prompt.sh ]
then
    . /usr/local/git/contrib/completion/git-prompt.sh
    GIT_PROMPT=1
fi

if [ $GIT_PROMPT -eq 1 ]
then
    PS1='[\e[1m\u@\h\e[m \W$(__git_ps1 " (%s)")]\$ '
fi

alias l='ls -AlhF --color=auto'
alias ls='ls -F --color=auto'

# bash on the Mac doesn't use the same option for colored output
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] || [ "$TERM_PROGRAM" == "iTerm.app" ]; then
    alias l='ls -AlhFG'
    alias ls='ls -FG'
fi

umask 002
