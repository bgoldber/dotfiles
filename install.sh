#!/bin/bash

SCRIPT_NAME=`basename $0`
DOTFILES_DIR=~/dotfiles
FILES=`ls $DOTFILES_DIR`

bu_dir=~/dotfiles_bu
backup=true
echo ""
echo "Before running install Maximum Awesome, Powerline, ZSH/OhMyZSH"
echo ""

sleep 3

echo ""
echo "Installing dotfiles. Existing files will backed up in $bu_dir ..."
echo ""

mkdir $bu_dir 2> /dev/null

for file in $FILES; do
    f=~/.$file
    if [ -a $f ]; then
        backup=true
        mv $f $bu_dir/$file
    fi
done

if ! $backup ; then
    rmdir $bu_dir
fi

for file in $FILES; do
    if [[ $file == $SCRIPT_NAME ]]; then
        continue
    else
        ln -s $DOTFILES_DIR/$file ~/.$file 2> /dev/null
        if [[ $? -eq 1 ]]; then
            echo "✗ - $file"
        else
            echo "✓ - $file"
        fi
    fi
done

echo ""
echo "Dotfile installation complete."
echo ""
