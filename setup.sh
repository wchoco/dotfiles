#!/bin/bash -eux
: "change directory to dotfiles root" && {
    cd $(dirname $0)
}
: "copy entrypoints" && {
    ENTRYPOINTS_DIR="entrypoints"
    cp $ENTRYPOINTS_DIR/.gitconfig $HOME/.gitconfig
    cp $ENTRYPOINTS_DIR/.tmux.conf $HOME/.tmux.conf
    cp $ENTRYPOINTS_DIR/.vimrc $HOME/.vimrc
    cp $ENTRYPOINTS_DIR/.zshrc $HOME/.zshrc


    : "gdb settings" && {
        if command -v gdb > /dev/null; then
            cp $ENTRYPOINTS_DIR/.gdbinit $HOME/.gdbinit
        fi
    }
}
