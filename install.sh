#!/bin/bash

echo "### Starting .dotfiles setup"

if [ -e ~/.dotfiles ]
then
    echo "### ERROR: Already bootstrapped dotfiles."
    exit 0
fi

if [ -d ~/.dotfiles_backup ]
then
    echo "OK: Backup directory exists."
else
    echo "OK: Creating ~/.dotfiles_backup directory."
    mkdir ~/.dotfiles_backup
fi

echo "# Looking home dir for existing dotfiles with the same name"
for file in `find _* -type f | cut -d _ -f 2` ;
do
    if [ -e ~/."$file" ]
    then
        echo "OK: Found .$file"
        mv ~/."$file" ~/.dotfiles_backup/
        echo "OK: Backed up .$file"
        ln -s $PWD/_"$file" ~/."$file"
        echo "OK: Symlinked .$file"
    else
        ln -s $PWD/_"$file" ~/."$file"
        echo "OK: Symlinked new .$file"
    fi
done

echo "# Backed up dotfiles (if any) will be located in ~/.dotfiles_backup"

touch ~/.dotfiles
echo "OK: Created a flag file."

if [ -f ~/.bash_profile ]
then
    echo "OK: Reloading .bash_profile"
    source ~/.bash_profile
else
    echo "OK: Reloading .bashrc"
    . ~/.bashrc
fi

echo "### Setup complete"
