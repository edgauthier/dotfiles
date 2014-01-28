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

TERM=xterm-16color
export TERM

WORKON_HOME=$HOME/.virtualenvs
export WORKON_HOME

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

OFEXPORT_HOME=$HOME/dev/ofexport
export OFEXPORT_HOME
PATH=$PATH:$OFEXPORT_HOME/bin
