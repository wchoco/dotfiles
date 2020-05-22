let s:start_path = expand('~/.config/dotfiles/config/vim/.vimrc')
if filereadable(s:start_path)
    execute 'source' s:start_path
endif
