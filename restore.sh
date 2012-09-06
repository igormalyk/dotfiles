#!/bin/bash

if [ ! -d ~/dotfiles_backup ]
then
    echo "ERROR: Backup directory ~/dotfiles_backup doesn't exist. Could not restore old files."
    while true; do
        read -p "Do you wish to continue and delete all symlinks created by boostrap.sh ?" yn
        case $yn in
            [Yy]* ) echo "OK: Bootstrapping ..."; break;;
            [Nn]* ) exit;;
                * ) echo "Please answer 'yes' or 'no'.";;
        esac
    done
else 
    echo "OK: Backup directory exists."
fi

for file in `ls -A . | egrep '^\.'` ; 
do
    if [ -L ~/"$file" ]
    then
        echo "OK: Unlinking $file"
        rm -rf ~/"$file"
        if [ -e ~/dotfiles_backup/"$file" ]
        then
            mv ~/dotfiles_backup/"$file" ~
            echo "OK: Resotred original $file"
        fi
    fi
done

if [ ! "$(ls -A ~/dotfiles_backup)" ];
then
    rm -rf ~/dotfiles_backup
    echo "OK: Empty backup directory has beed removed."
else
    echo "ERROR: Backup direcotry is not empty. Something has gone wrong."
fi

if [ -e .dotfiles ]
then
    rm .dotfiles
    echo "OK: Removed flag file."
else
    echo "ERROR: 'Flag file not found."
fi
