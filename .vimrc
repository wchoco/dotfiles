function! s:source_rc(path)
    let s:confdir = expand('~/.config/vim')
    if filereadable(expand(s:confdir . a:path))
        execute 'source' s:confdir . a:path
    endif
endfunction

call s:source_rc('/default.vim')
