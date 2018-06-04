filetype off
syntax on
language en_US.UTF-8

if &compatible
  set nocompatible
endif

" color schemes
colorscheme zellner
highlight LineNr ctermfg=darkred

" set options
set autoindent " inherit indent
set backspace=2 " delete by backspace
set browsedir=buffer " open directory in buffer
set cmdheight=2 " height of command line
set expandtab " tab to space
set hidden " can open without save
set hlsearch " highlight word
set ignorecase " ignore upper or lower
set incsearch " increment search
set laststatus=2 " position of command line
set list " show invisible character
set listchars=tab:>\ ,extends:< " show tab, extend
set number " show line number
set ruler " show current line number
set shiftwidth=4 " indent width
set shortmess+=I " skip message
set showcmd " show command in writing
set showmatch " show match pair
set smartcase " ignore only all lower case
set smartindent " add indent by end
set smarttab " shift indent by tab
set splitright " split pane right
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " status line
set tabstop=4 " tab width
set title " show file path in status line
set whichwrap=b,s,h,l,<,>,[,] " not to stop by wrap
set wildmenu " complete command by tab

" remenber last session cursor position
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" shortcut
"" toggle number, paste
nnoremap <silent> <C-j> :set number!<CR>
nnoremap <silent> <C-p> :set paste!<CR>
"" file type
nmap <silent> :ft :set filetype=
"" reset highlight
nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>
"" session manage
nmap [SPACE] <Nop>
nmap <SPACE> [SPACE]
nmap [SPACE]<SPACE> <Nop>
""" move pane
nnoremap [SPACE]j <C-w>j
nnoremap [SPACE]k <C-w>k
nnoremap [SPACE]l <C-w>l
nnoremap [SPACE]h <C-w>h
nnoremap [SPACE]w <C-w>w
""" exchange pane
nnoremap [SPACE]J <C-w>J
nnoremap [SPACE]K <C-w>K
nnoremap [SPACE]L <C-w>L
nnoremap [SPACE]H <C-w>H
nnoremap [SPACE]r <C-w>r
nnoremap [SPACE]R <C-w>R
""" change size
nnoremap [SPACE]o <C-w>_<C-w>\|
nnoremap [SPACE]_ <C-w>_
nnoremap [SPACE]\| <C-w>\|
nnoremap [SPACE]O <C-w>=
nnoremap [SPACE]= <C-w>=
""" move baffer
nnoremap [SPACE]N :<C-u>bn<CR>
nnoremap [SPACE]P :<C-u>bp<CR>
""" move tab
nnoremap [SPACE]n gt
nnoremap [SPACE]p gT
""" create tab
nnoremap [SPACE]t :<C-u>tabnew<CR>
nnoremap [SPACE]T <C-w>T
""" create pane
nnoremap [SPACE]s :<C-u>sp<CR>
nnoremap [SPACE]v :<C-u>vs<CR>
""" quit & save
nnoremap [SPACE]q :<C-u>q<CR>
nnoremap [SPACE]z :<C-u>w<CR>
nnoremap [SPACE]Q :<C-u>bd<CR>
nnoremap [SPACE]W :<C-u>wall<CR>

filetype plugin indent on
