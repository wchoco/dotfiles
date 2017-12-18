# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000 # memory limit
export SAVEHIST=1000000 # history limit
setopt hist_ignore_dups
setopt EXTENDED_HISTORY # record start and finish
function history-all { history -E 1 }
setopt share_history
setopt hist_ignore_space # ignore line starting with space
setopt hist_verify # editable before execution
setopt hist_reduce_blanks
setopt hist_no_store # not add history command
setopt hist_expand # expand history when autocomplete
setopt inc_append_history

# alias
alias ll="ls -lah"
alias vi="nvim"
alias fig="docker-compose"
alias excel="open -a \"/Applications/Microsoft Excel.app\""

# environment
## pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
hash pyenv 2> /dev/null && eval "$(pyenv init -)"
## nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
## go
export GOPATH="${HOME}/go"
export PATH="${HOME}/.local/bin/go/bin:$PATH"
export PATH="${GOPATH}/bin:$PATH"

# ls
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -GF"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

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
prompt elite2

# autosuggestions
[ -d ~/.config/zsh/zsh-autosuggestions ] ||
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# source
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
