# source
CONFIG_DIR="${HOME}/.config/dotfiles/config/zsh"
function source_rc() {
    [ -f ${CONFIG_DIR}/$1 ] && source ${CONFIG_DIR}/$1
}

source_rc base.zsh
source_rc prompt.zsh
source_rc plugin.zsh
source_rc fzf.zsh
source_rc zoxide.zsh
[ -n "${WSL_DISTRO_NAME}" ] && source_rc wsl.zsh
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
