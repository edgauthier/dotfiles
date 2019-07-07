Installation
============

*Assumes zsh is already set as the current shell*

    git clone https://github.com/edgauthier/dotfiles.git <dotfiles repo>
    git clone https://github.com/VundleVim/Vundle.vim.git <dotfiles repo>/vim/bundle/Vundle.vim
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    cd <dotfiles repo>
    git submodule update --init
    git config --global core.excludesfile <absolute path to dotfiles repo>/gitignore-global
    
    To complete the installation of the Vim plugins, start Vim and run :PluginInstall

Linux
-----

1. Run setup.py from within the .dotfiles directory

Windows
-------

1. Copy contents of *windows* directory to your user directory.
1. Edit *_vimrc* and set **$DOTFILES** to the path of the cloned dotfiles repository.
1. Edit *_gvimrc* and set **$DOTFILES** to the path of the cloned dotfiles repository.
