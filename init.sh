#!/bin/bash -eux
: 'install fzf' && {
    ! exist fzf && ask 'install fzf?' && {
        git clone https://github.com/junegunn/fzf.git ${LOCAL_PATH}/src/fzf
        ${LOCAL_PATH}/src/fzf/install
    }
    ! exist z && ask 'install z?' && {
        git clone https://github.com/rupa/z.git ${LOCAL_PATH}/src/z
    }
}
: 'install zsh-autosuggestions plugin' && {
    TARGET="${HOME}/.config/zsh/zsh-autosuggestions"
    [ ! -d ${TARGET} ] && ask 'install zsh-autosuggestions?' && \
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
}
: 'install zsh-syntax-highlighting plugin' && {
    [ ! -d ~/.config/zsh/zsh-syntax-highlighting ] && ask 'install zsh-syntax-highlighting?' && \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
}
