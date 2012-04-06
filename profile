PYTHONPATH=~/dev/python
export PYTHONPATH

if [ -d /usr/local/git/bin ]; then
    PATH=/usr/local/git/bin:$PATH
    export PATH
fi

PATH=/usr/local/bin:~/bin:~/dev/python:$PATH
export PATH

EDITOR=/usr/bin/vim
export EDITOR

TERM=xterm-256color
export TERM

if [ -d /Users/ed/dev/perforce ]; then
    P4ROOT=/Users/ed/dev/perforce
    export P4ROOT
fi

P4HOST=localhost
export P4HOST

P4USER=ed
export P4USER

P4PORT=$P4HOST:1666
export P4PORT
