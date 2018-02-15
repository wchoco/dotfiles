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
        $DIFFCOMMAND $HOME/$file $DOTFILESDIR/$file
        flag=$?
        message="\033[31;4mPUSH $DOTFILESDIR/$file -> $HOME/$file ?(y/N)\033[0m"
    else
        cat $DOTFILESDIR/$file
        flag=1
        message="\033[31;4mCREATE $HOME/$file ?(y/N)\033[0m"
    fi

    if [ $flag = 1 ]; then
        while true;do
            echo -e "$message"
            read ans
            case $ans in
                y)
                    cp $HOME/$file backup/$file.$TIMESTAMP
                    mkdir -p `echo $HOME/$file | sed -e "s/[^/]*$//"` > /dev/null 2>&1
                    cp -v $DOTFILESDIR/$file $HOME/$file
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

