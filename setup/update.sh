#!/bin/bash
<< README
update dotfiles

===Usage===
update.sh

README
cd `dirname $0`

diff ../zsh/.zshrc ~/.zshrc || {
while true;do
    echo "Update .zshrc?(Y/n)"
    read ans
    case $ans in
        n)
            break
            ;;
        *)
            cp ../zsh/.zshrc ~/.zshrc
            break
            ;;
    esac
done
}

diff ../vim/.vimrc ~/.vimrc || {
while true;do
    echo "Update .vimrc?(Y/n)"
    read ans
    case $ans in
        n)
            break
            ;;
        *)
            cp ../vim/.vimrc ~/.vimrc
            break
            ;;
    esac
done
}

function update(){
    for i in `ls ../neovim/${1}`;do
        if [ -d ../neovim/${1}${i} ];then
            update ${1}${i}/
        else
            diff ../neovim/${1}${i} ~/.config/nvim/${1}${i} || {
            while true;do
                echo "Update ~/.config/nvim/${1}${i}?(Y/n)"
                read ans
                case $ans in
                    n)
                        break
                        ;;
                    *)
                        cp ../neovim/${1}${i} ~/.config/nvim/${1}${i}
                        break
                        ;;
                esac
            done
            }
        fi
    done
}

update
