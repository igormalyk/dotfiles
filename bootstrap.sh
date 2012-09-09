#!/bin/bash

# @todo read this https://github.com/revans/bash-it/blob/master/install.sh
# and make the install prcess interactive

while true; do
    read -p "Do you wish to install the dotfiles in your home folder ?" yn
    case $yn in
        [Yy]* ) echo "OK: Bootstrapping ..."; break;;
        [Nn]* ) exit;;
            * ) echo "Please answer 'yes' or 'no'.";;
    esac
done

if [ -e .dotfiles ]
then
    echo "ERROR: Already bootstrapped dotfiles."
    exit 0
fi

if [ -d ~/.dotfiles_backup ]
then
    echo "OK: Backup directory already exists."
else
    echo "OK: Creating ~/.dotfiles_backup directory."
    mkdir ~/.dotfiles_backup
fi

for file in `ls -A . | egrep '^\.'` ; 
do
    if [ -e ~/"$file" ]
    then
        echo "OK: Found $file in user home"
        mv ~/"$file" ~/.dotfiles_backup/
        echo "OK: Backed up $file in ~/.dotfiles_backup"
        ln -s $PWD/"$file" ~/"$file"
        echo "OK: Symlinked $file"
    else
        ln -s $PWD/"$file" ~/"$file"
        echo "OK: Symlinked new $file"
    fi
done

> .dotfiles
echo "OK: Created a flag file."
