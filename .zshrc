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
alias chrome="open -a \"/Applications/Google Chrome.app\""
alias github="open \$(git remote -v | grep push | cut -f2 | cut -d ' ' -f1 | sed -e 's/:[0-9][0-9]*//' -e 's/ssh:\/\/git@/http:\/\//' -e 's/\.git//' -e 's/:[^/]/\//')"

# function
function reck() {
    for arg in $*
    do
    python -c "print($arg)"
    done
}
function mkgitignore() {
    curl -s https://www.gitignore.io/api/`echo "$*" | sed -e "s/ /,/"` > .gitignore
}

# environment
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
## pyenv (git clone https://github.com/pyenv/pyenv.git ~/.pyenv)
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
hash pyenv 2> /dev/null && eval "$(pyenv init -)"
## nodebrew (curl -L git.io/nodebrew | perl - setup)
export PATH=${HOME}/.nodebrew/current/bin:$PATH
## go
export GOPATH="${HOME}/go"
export PATH="${HOME}/.local/bin/go/bin:$PATH"
export PATH="${GOPATH}/bin:$PATH"
## rust
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
function rust_run() {
    rustc $1
    local binary=$(basename $1 .rs)
    ./$binary
    rm ./$binary
}
alias rr="rust_run"

# ls
export LSCOLORS=cxfxexdxbxegedabagacad
export LS_COLORS='rs=0:di=32;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lz4=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.cab=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.webm=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:'
alias ls="ls -GF"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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
export FPATH="${HOME}/.config/zsh/site-functions:${FPATH}"
autoload -U promptinit
promptinit
prompt coral

# autosuggestions
[ -d ~/.config/zsh/zsh-autosuggestions ] ||
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# color_command
[ -d ~/.config/zsh/zsh-syntax-highlighting ] ||
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
