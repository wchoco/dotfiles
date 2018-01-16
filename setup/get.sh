#!/bin/bash
<< README
update dotfiles

===Usage===
update.sh

README
cd `dirname $0`

diff ~/.zshrc ../zsh/.zshrc || {
while true;do
    echo -e "\033[31;4mGet .zshrc?(Y/n)\033[0m"
    read ans
    case $ans in
        n)
            break
            ;;
        *)
            cp ~/.zshrc ../zsh/.zshrc
            break
            ;;
    esac
done
}

diff ~/.vimrc ../vim/.vimrc || {
while true;do
    echo -e "\033[31;4mGet .vimrc?(Y/n)\033[0m"
    read ans
    case $ans in
        n)
            break
            ;;
        *)
            cp ~/.vimrc ../vim/.vimrc
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
            diff ~/.config/nvim/${1}${i} ../neovim/${1}${i} || {
            while true;do
                echo -e "\033[31;4mGet ~/.config/nvim/${1}${i}?(Y/n)\033[0m"
                read ans
                case $ans in
                    n)
                        break
                        ;;
                    *)
                        cp ~/.config/nvim/${1}${i} ../neovim/${1}${i}
                        break
                        ;;
                esac
            done
            }
        fi
    done
}

update
