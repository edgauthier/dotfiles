#!/usr/bin/env python

import os
from subprocess import call

# files to exclude when symlinking to the home directory
excludedFiles = ('.git', '.gitmodules', '.gitignore', 'setupLinks.py', 
    'README.md', 'TerminalColorSchemes', 'windows', '.DS_Store')

# settings to add to .gitconfig
settings = dict()
settings['user.email'] = 'ed@egauthier.net'
settings['user.name'] = 'Ed Gauthier'
settings['github.user'] = 'edgauthier'
settings['github.token'] = None
settings['core.excludesfile'] = os.path.expanduser('~/.gitignore-global')
settings['push.default'] = 'upstream'
settings['branch.autosetupmerge'] = 'always'
settings['branch.autosetuprebase'] = 'always'

################################################################################
# Set up symlinks in the home directory to all files in the current directory
# except for those listed in excludedFiles
################################################################################

dotfiles = os.path.expanduser('~/.dotfiles')
old_dotfiles = os.path.expanduser('~/.old-dotfiles')

# format different paths for a given file
def paths(fileName):
    homeFile = os.path.expanduser('~/.' + fileName)
    oldFile = os.path.join(old_dotfiles,fileName)
    dotFile = os.path.join(dotfiles,fileName)
    return (homeFile, oldFile, dotFile)

try:
    os.mkdir(old_dotfiles)
except (OSError):
    pass

for fileName in os.listdir(dotfiles):
    if fileName in excludedFiles: continue
    homeFile, oldFile, dotFile = paths(fileName)

    try:
        os.rename(homeFile,oldFile)
    except (OSError):
        pass

    try:
        os.symlink(dotFile,homeFile)
    except (OSError):
        pass

################################################################################
# Set up .gitconfig
################################################################################

gitConfigArgs = ['git', 'config', '--global']
for setting, settingValue in settings.iteritems():
    if settingValue == None:
        settingValue = raw_input(setting + ' = ')
    call(gitConfigArgs + [setting, settingValue])

