#!/bin/bash

DIFFCOMMAND=$1
if [ -z "$DIFFCOMMAND" ]; then
    DIFFCOMMAND="diff -u"
fi
DOTFILESDIR="$HOME/dotfiles"
TIMESTAMP=`date "+%Y%m%d_%H%M%S"`

cd $DOTFILESDIR

for file in `
find . -type d -name ".git" -prune -o\
    -type d -name "setup" -prune -o\
    -type d -name "backup" -prune -o\
    -type f -not -name .gitignore -print |\
    sed -e 's!^./!!'`;do
    if [ -f $HOME/$file ]; then
        $DIFFCOMMAND $DOTFILESDIR/$file $HOME/$file
        flag=$?
        message="\033[31;4mFETCH $HOME/$file -> $DOTFILESDIR/$file ?(y/N)\033[0m"
    else
        echo -e "\033[31;4m$HOME/$file: No such file\033[0m"
        echo ""
        continue
    fi

    if [ $flag = 1 ]; then
        while true;do
            echo -e "$message"
            read ans
            case $ans in
                y)
                    cp $DOTFILESDIR/$file backup/$file.$TIMESTAMP
                    cp -v $HOME/$file $DOTFILESDIR/$file
                    echo ""
                    break
                    ;;
                *)
                    break
                    ;;
            esac
        done
    fi
done

