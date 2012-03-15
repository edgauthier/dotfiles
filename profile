PATH=/usr/local/bin:$PATH
export PATH

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]
then
    . /usr/local/git/contrib/completion/git-completion.bash
fi

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
