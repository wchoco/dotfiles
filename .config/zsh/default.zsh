# environment
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>."
export FPATH="${HOME}/.config/zsh/site-functions:${FPATH}"
export LOCAL_PATH="${HOME}/.local"
export PATH="${LOCAL_PATH}/bin:${PATH}"


# alias
alias vi="vim"
alias tm="tmux"
alias excel="open -a \"/Applications/Microsoft Excel.app\""
alias chrome="open -a \"/Applications/Google Chrome.app\""
alias github="open \$(git remote -v | grep push | cut -f2 | cut -d ' ' -f1 | sed -e 's/:[0-9][0-9]*//' -e 's/ssh:\/\/git@/http:\/\//' -e 's/\.git//' -e 's/:[^/]/\//')"


# function
function gitignore() {
    curl -s https://www.gitignore.io/api/`echo "$*" | sed -e "s/ /,/"`
}

function svi() {
    vi `which $1`
}


# history
function history_all { history -E 1 }
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000 # memory limit
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
alias ls="exa -F"
alias ll="exa -Fal"
alias tree="exa -T"

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


# prompt
autoload -U promptinit
promptinit
prompt chocomint

# anyenv
eval "$(anyenv init -)"

# source
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
