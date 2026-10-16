#!/bin/bash -eu
# link config files to the locations each tool reads
cd $(dirname $0)
DOTFILES=$(pwd)
BACKUP_DIR="${DOTFILES}/backup/$(date +%Y%m%d%H%M%S)"

function link() {
    local src="${DOTFILES}/$1" dst="$2"
    [ "$(readlink "${dst}")" = "${src}" ] && return
    if [ -e "${dst}" ] || [ -L "${dst}" ]; then
        mkdir -p "${BACKUP_DIR}"
        mv "${dst}" "${BACKUP_DIR}/"
        echo "backup: ${dst} -> ${BACKUP_DIR}/"
    fi
    mkdir -p "$(dirname "${dst}")"
    ln -s "${src}" "${dst}"
    echo "link: ${dst} -> ${src}"
}

link config/zsh/.zshrc "${HOME}/.zshrc"
link config/vim/.vimrc "${HOME}/.vimrc"
link config/git/config "${HOME}/.config/git/config"
link config/git/ignore "${HOME}/.config/git/ignore"
link config/zellij/config.kdl "${HOME}/.config/zellij/config.kdl"
link config/claude/settings.json "${HOME}/.claude/settings.json"
link config/claude/keybindings.json "${HOME}/.claude/keybindings.json"

# ~/.gitconfig is read after ~/.config/git/config and would override it
if [ -f "${HOME}/.gitconfig" ] && [ ! -L "${HOME}/.gitconfig" ]; then
    mkdir -p "${BACKUP_DIR}"
    mv "${HOME}/.gitconfig" "${BACKUP_DIR}/"
    echo "backup: ${HOME}/.gitconfig -> ${BACKUP_DIR}/"
fi
