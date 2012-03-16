PS1='[\e[1m\u@\h\e[m \W$(__git_ps1 " (%s)")]\$ '

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]
then
    . /usr/local/git/contrib/completion/git-completion.bash
fi

if [ -f /etc/bash_completion.d/git ]
then
    . /etc/bash_completion.d/git
fi

