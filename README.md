Installation
============

    git clone git@github.com:edgauthier/dotfiles.git <dotfiles repo>
    cd <dotfiles repo>
    git submodule update --init
    git config --global core.excludesfile <absolute path to dotfiles repo>/gitignore-global

Linux
-----

1. Run setupLinks.py from within the .dotfiles directory

Windows
-------

1. Copy contents of *windows* directory to your user directory.
1. Edit *_vimrc* and set **$DOTFILES** to the path of the cloned dotfiles repository.
1. Edit *_gvimrc* and set **$DOTFILES** to the path of the cloned dotfiles repository.
