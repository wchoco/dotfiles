#!/bin/bash

DIFFCOMMAND=$1
if [ -z "$DIFFCOMMAND" ]; then
    DIFFCOMMAND="diff -u"
fi
DOTFILESDIR="$HOME/dotfiles"

cd $DOTFILESDIR

for file in `
find . -type d -name ".git" -prune -o -type d -name "setup" -prune -o -type f -print |\
    sed -e 's!^./!!'`;do
    if [ -f $HOME/$file ]; then
        $DIFFCOMMAND $DOTFILESDIR/$file $HOME/$file
        flag=$?
        message="\033[31;4mFETCH $HOME/$file -> $DOTFILESDIR/$file ?(y/N)\033[0m"
    else
        echo -e "\033[31;4m$HOME/$file: No such file\033[0m"
        continue
    fi

    if [ $flag = 1 ]; then
        while true;do
            echo -e "$message"
            read ans
            case $ans in
                y)
                    cp -v $HOME/$file $DOTFILESDIR/$file
                    break
                    ;;
                *)
                    break
                    ;;
            esac
        done
    fi
done

