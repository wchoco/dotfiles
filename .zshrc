# source
CONFIG_DIR="${HOME}/.config/zsh"
function source_rc() {
    [ -f ${CONFIG_DIR}/$1 ] && source ${CONFIG_DIR}/$1
}

source_rc plugin.zsh
source_rc python.zsh
source_rc rust.zsh
source_rc go.zsh
source_rc node.zsh
source_rc fzf.zsh
source_rc default.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rokajima/.pyenv/versions/miniconda3-4.3.30/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rokajima/.pyenv/versions/miniconda3-4.3.30/etc/profile.d/conda.sh" ]; then
        . "/home/rokajima/.pyenv/versions/miniconda3-4.3.30/etc/profile.d/conda.sh"
    else
        export PATH="/home/rokajima/.pyenv/versions/miniconda3-4.3.30/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

