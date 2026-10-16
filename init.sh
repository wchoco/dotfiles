#!/bin/zsh
# install tools into ~/.local without sudo
LOCAL_PATH="${LOCAL_PATH:-${HOME}/.local}"
mkdir -p ${LOCAL_PATH}/bin ${LOCAL_PATH}/src

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
    TARGET="${LOCAL_PATH}/src/fzf"
    ! exist fzf && [ ! -d ${TARGET} ] && ask 'install fzf?' && {
        git clone --depth 1 https://github.com/junegunn/fzf.git ${TARGET}
        ${TARGET}/install --bin
    }
}
: 'install zoxide' && {
    ! exist zoxide && ask 'install zoxide?' && \
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
}
: 'install zsh-autosuggestions plugin' && {
    TARGET="${LOCAL_PATH}/src/zsh-autosuggestions"
    [ ! -d ${TARGET} ] && ask 'install zsh-autosuggestions?' && \
        git clone https://github.com/zsh-users/zsh-autosuggestions ${TARGET}
}
: 'install zsh-syntax-highlighting plugin' && {
    TARGET="${LOCAL_PATH}/src/zsh-syntax-highlighting"
    [ ! -d ${TARGET} ] && ask 'install zsh-syntax-highlighting?' && \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${TARGET}
}
: 'install zellij' && {
    ! exist zellij && ask 'install zellij?' && \
        curl -sSfL "https://github.com/zellij-org/zellij/releases/latest/download/zellij-$(uname -m)-unknown-linux-musl.tar.gz" \
            | tar -xz -C ${LOCAL_PATH}/bin
}
: 'install claude code' && {
    ! exist claude && ask 'install claude code?' && \
        curl -fsSL https://claude.ai/install.sh | bash
}
