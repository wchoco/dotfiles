#!/bin/zsh
# install tools into ~/.local without sudo
#   init.sh         install missing tools
#   init.sh update  update tools installed by this script
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

# install_<tool>: install the tool
# update_<tool>: update the tool if it was installed by install_<tool>
TOOLS=(fzf zoxide zsh_autosuggestions zsh_syntax_highlighting zellij claude)

: 'fzf' && {
    FZF_DIR="${LOCAL_PATH}/src/fzf"
    function install_fzf() {
        ! exist fzf && [ ! -d ${FZF_DIR} ] && ask 'install fzf?' && {
            git clone --depth 1 https://github.com/junegunn/fzf.git ${FZF_DIR}
            ${FZF_DIR}/install --bin
        }
    }
    function update_fzf() {
        [ -d ${FZF_DIR} ] && {
            git -C ${FZF_DIR} pull --ff-only
            ${FZF_DIR}/install --bin
        }
    }
}
: 'zoxide' && {
    function _install_zoxide() {
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    }
    function install_zoxide() {
        ! exist zoxide && ask 'install zoxide?' && _install_zoxide
    }
    function update_zoxide() {
        [ -x ${LOCAL_PATH}/bin/zoxide ] && _install_zoxide
    }
}
: 'zsh plugins' && {
    function _install_zsh_plugin() {
        local target="${LOCAL_PATH}/src/${1:t}"
        [ ! -d ${target} ] && ask "install ${1:t}?" && git clone $1 ${target}
    }
    function _update_zsh_plugin() {
        local target="${LOCAL_PATH}/src/${1:t}"
        [ -d ${target} ] && git -C ${target} pull --ff-only
    }
    ZSH_AUTOSUGGESTIONS_REPO=https://github.com/zsh-users/zsh-autosuggestions
    ZSH_SYNTAX_HIGHLIGHTING_REPO=https://github.com/zsh-users/zsh-syntax-highlighting
    function install_zsh_autosuggestions() { _install_zsh_plugin ${ZSH_AUTOSUGGESTIONS_REPO} }
    function update_zsh_autosuggestions() { _update_zsh_plugin ${ZSH_AUTOSUGGESTIONS_REPO} }
    function install_zsh_syntax_highlighting() { _install_zsh_plugin ${ZSH_SYNTAX_HIGHLIGHTING_REPO} }
    function update_zsh_syntax_highlighting() { _update_zsh_plugin ${ZSH_SYNTAX_HIGHLIGHTING_REPO} }
}
: 'zellij' && {
    ZELLIJ_REPO=https://github.com/zellij-org/zellij
    function _install_zellij() {
        curl -sSfL "${ZELLIJ_REPO}/releases/latest/download/zellij-$(uname -m)-unknown-linux-musl.tar.gz" \
            | tar -xz -C ${LOCAL_PATH}/bin
    }
    function install_zellij() {
        ! exist zellij && ask 'install zellij?' && _install_zellij
    }
    function update_zellij() {
        [ -x ${LOCAL_PATH}/bin/zellij ] || return 0
        local current=$(${LOCAL_PATH}/bin/zellij --version | cut -d' ' -f2)
        local latest=$(curl -sSfLI -o /dev/null -w '%{url_effective}' ${ZELLIJ_REPO}/releases/latest | sed 's#.*/v##')
        if [ "${current}" = "${latest}" ]; then
            echo "zellij ${current} is up to date"
        else
            echo "zellij ${current} -> ${latest}"
            _install_zellij
        fi
    }
}
: 'claude code' && {
    function install_claude() {
        ! exist claude && ask 'install claude code?' && \
            curl -fsSL https://claude.ai/install.sh | bash
    }
    function update_claude() {
        exist claude && claude update
    }
}

case "$1" in
    "")
        for tool in ${TOOLS}; do install_${tool}; done
        ;;
    update)
        for tool in ${TOOLS}; do
            echo "== ${tool}"
            update_${tool}
        done
        ;;
    *)
        echo "usage: $0 [update]" >&2
        exit 1
        ;;
esac
