# source
CONFIG_DIR="${HOME}/.config/dotfiles/config/zsh"
function source_rc() {
    [ -f ${CONFIG_DIR}/$1 ] && source ${CONFIG_DIR}/$1
}

source_rc default.zsh
source_rc plugin.zsh
source_rc python.zsh
source_rc rust.zsh
source_rc go.zsh
source_rc node.zsh
