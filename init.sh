#!/bin/zsh
function exist() {
    command -v $1 > /dev/null 2>&1
}
function ask() {
    read -q "?${1} [y/N]"
    ret=$?
    echo
    return $ret
}

: 'install fzf' && {
    ! exist fzf && ask 'install fzf?' && {
        git clone https://github.com/junegunn/fzf.git ${LOCAL_PATH}/src/fzf
        ${LOCAL_PATH}/src/fzf/install
    }
    TARGET="${LOCAL_PATH}/zsh/z"
    [ ! -d ${TARGET} ] && ask 'install z?' && {
        git clone https://github.com/rupa/z.git ${TARGET}
    }
}
: 'install zsh-autosuggestions plugin' && {
    TARGET="${HOME}/.config/zsh/zsh-autosuggestions"
    [ ! -d ${TARGET} ] && ask 'install zsh-autosuggestions?' && \
        git clone https://github.com/zsh-users/zsh-autosuggestions ${TARGET}
}
: 'install zsh-syntax-highlighting plugin' && {
    TARGET=~/.config/zsh/zsh-syntax-highlighting
    [ ! -d ${TARGET} ] && ask 'install zsh-syntax-highlighting?' && \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${TARGET}
}
