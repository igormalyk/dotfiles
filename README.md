# My dotfiles
These are the dotfiles I use everyday. Feel free to use them too.

## Install
1. Clone the repository
2. Run bootstrap.sh

**NOTE**
It will backup all your dotfiles which have the same names with those in the repository and create symlinks from the repo directory to the home directory.
After backup is over original files could be found in the ~/dotfiles_backup

## Uninstall
To return everything back just run restore.sh
It will remove all the created symlinks, move original files back and delete the useless backup folder.

## TODO
1. Make installation interactive - user should be able to choose what files to replace.
2. Make bootstrap.sh recognize command line ooptions.
3. Support of at least two levels of verbosity.
