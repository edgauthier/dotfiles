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
