#!/usr/bin/env python

import os
import sys
from subprocess import call

# files to exclude when symlinking to the home directory
excludedFiles = ('.git', '.gitmodules', '.gitignore', 'setupLinks.py', 
    'README.md', 'TerminalColorSchemes', 'windows', '.DS_Store')

# settings to add to .gitconfig
gitSettings = dict()
gitSettings['user.email'] = 'ed@egauthier.net'
gitSettings['user.name'] = 'Ed Gauthier'
gitSettings['github.user'] = 'edgauthier'
gitSettings['github.token'] = None
gitSettings['core.excludesfile'] = os.path.expanduser('~/.gitignore-global')
gitSettings['push.default'] = 'upstream'
gitSettings['branch.autosetuprebase'] = 'always'

# settings to configure on this dotfiles repository
dotfilesSettings = dict()
dotfilesSettings['branch.master.rebase'] = 'true'

################################################################################
# Set up symlinks in the home directory to all files in the current directory
# except for those listed in excludedFiles
################################################################################

dotfiles = sys.path[0] # the script's directory
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
for setting, settingValue in gitSettings.iteritems():
    if settingValue == None:
        settingValue = raw_input(setting + ' = ')
    if len(settingValue) > 0:
        call(gitConfigArgs + [setting, settingValue])

# now tweak some local settings for the dotfiles repository that might not be
# set if gitconfig wasn't set up already (such as with a fresh clone.
dotfilesConfigFile = os.path.join(dotfiles,'.git','config')
gitConfigArgs = ['git', 'config', '-f', dotfilesConfigFile]
for setting, settingValue in dotfilesSettings.iteritems():
    if settingValue == None:
        settingValue = raw_input('[dotfiles] '  + setting + ' = ')
    if len(settingValue) > 0:
        call(gitConfigArgs + [setting, settingValue])
