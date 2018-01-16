#!/bin/bash
<< README
update dotfiles

===Usage===
update.sh

README
cd `dirname $0`

diff ../zsh/.zshrc ~/.zshrc || {
while true;do
    echo -e "\033[31;4mUpdate .zshrc?(Y/n)\033[0m"
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
    echo -e "\033[31;4pdate .vimrc?(Y/n)\033[0m"
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
                echo -e "\033[31;4mUpdate ~/.config/nvim/${1}${i}?(Y/n)\033[0m"
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
