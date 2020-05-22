# environment
export LOCAL_PATH="${HOME}/.local"
export PATH="${LOCAL_PATH}/bin:${PATH}"
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>."


# alias
alias vi="vim"
alias tm="tmux"
alias chrome="open -a \"/Applications/Google Chrome.app\""


# function
function exist() {
    command -v $1 > /dev/null 2>&1
}

function deref() {
    $1 `which $2`
}

function gitignore() {
    curl -s https://www.gitignore.io/api/`echo "$*" | sed -e "s/ /,/"`
}

function ask() {
    read -q "?${1} [y/N]"
    ret=$?
    echo
    return $ret
}


# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000 # memory limit
export SAVEHIST=1000000 # history limit
setopt hist_ignore_dups
setopt EXTENDED_HISTORY # record start and finish
setopt share_history
setopt hist_ignore_space # ignore line starting with space
setopt hist_verify # editable before execution
setopt hist_reduce_blanks
setopt hist_no_store # not add history command
setopt hist_expand # expand history when autocomplete
setopt inc_append_history


# ls
alias ls="ls -GF"
alias ll="ls -lah"
alias l="/bin/ls"

# push directory
setopt auto_pushd #cd -<TAB>
setopt pushd_ignore_dups


# autocomplete
zmodload zsh/complist
autoload -Uz compinit; compinit
zstyle ':completion:*:default' menu select=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char


# keymap
bindkey -v
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
