#!/usr/bin/env python

import os

dotfiles = os.path.expanduser('~/.dotfiles')
old_dotfiles = os.path.expanduser('~/.old-dotfiles')
excluded = ('.git', '.gitmodules', '.gitignore', 'setupLinks.py', 
    'README.md', 'TerminalColorSchemes', 'windows', '.DS_Store')

def paths(file):
    homeFile = os.path.expanduser('~/.' + file)
    oldFile = os.path.join(old_dotfiles,file)
    dotFile = os.path.join(dotfiles,file)
    return (homeFile, oldFile, dotFile)

try:
    os.mkdir(old_dotfiles)
except (OSError):
    pass

for file in os.listdir(dotfiles):
    if file in excluded: continue
    homeFile, oldFile, dotFile = paths(file)

    try:
        os.rename(homeFile,oldFile)
    except (OSError):
        pass

    try:
        os.symlink(dotFile,homeFile)
    except (OSError):
        pass
