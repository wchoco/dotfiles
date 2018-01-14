filetype off

set ruler "カーソルの行数表示
set cmdheight=2 "コマンドラインの行数
set laststatus=2 "エディタ末尾2行目にステータスライン表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P "ステータスライン表示
set title "タイトルバーにファイルパス情報の表示
set wildmenu "コマンドラインモードで<Tab>によるファイル名補完有効化
set showcmd "入力中のコマンドの表示
set browsedir=buffer "バッファの位置でエクスプローラ開始
set ignorecase "大文字小文字無視
set smartcase "小文字のみの検索で大文字小文字無視
set hlsearch "検索のハイライト表示
set expandtab "タブを空白入力にする
set tabstop=4 "タブ文字の表示幅
set shiftwidth=4 "Vimが挿入するインデント幅
set smarttab "行頭空白内で<Tab>を打ち込むと'shiftwidth'だけインデント
set incsearch "入力しつつ検索
set hidden "保存していなくても他のファイルを開けるようにする
set list "不可視文字を表示
set listchars=tab:>\ ,extends:< "タブと行の続きの可視化
set number "行番号表示
set showmatch "対応する括弧の表示
set autoindent "改行時のインデント継続
set smartindent "末尾に合わせてインデント増減
set whichwrap=b,s,h,l,<,>,[,] "カーソルが行頭行末で止まらないようにする
syntax on "構文毎に文字色を変化
colorscheme zellner "カラースキーム
highlight LineNr ctermfg=darkred "行番号の色
set backspace=2 "backspaceで削除できるようにする

augroup file_type_indent
    autocmd!
    autocmd BufRead,BUfNewFile *.js* setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" number, paste切り替え
nnoremap <silent> <C-j> :set number!<CR>
nnoremap <silent> <C-p> :set paste!<CR>

" change filetype
nmap <silent> :ft :set filetype=
nmap <silent> :glsl :set filetype=glsl<CR>
nmap <silent> :js :set filetype=javascript<CR>

nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>

nmap [SPACE] <Nop>
nmap <SPACE> [SPACE]
nmap [SPACE]<SPACE> <Nop>
" move pane
nnoremap [SPACE]j <C-w>j
nnoremap [SPACE]k <C-w>k
nnoremap [SPACE]l <C-w>l
nnoremap [SPACE]h <C-w>h
nnoremap [SPACE]w <C-w>w
" exchange pane
nnoremap [SPACE]J <C-w>J
nnoremap [SPACE]K <C-w>K
nnoremap [SPACE]L <C-w>L
nnoremap [SPACE]H <C-w>H
nnoremap [SPACE]r <C-w>r
nnoremap [SPACE]R <C-w>R
" change size
nnoremap [SPACE]o <C-w>_<C-w>\|
nnoremap [SPACE]_ <C-w>_
nnoremap [SPACE]\| <C-w>\|
nnoremap [SPACE]O <C-w>=
nnoremap [SPACE]= <C-w>=
" move baffer
nnoremap [SPACE]N :<C-u>bn<CR>
nnoremap [SPACE]P :<C-u>bp<CR>
" move tab
nnoremap [SPACE]n gt
nnoremap [SPACE]p gT
" create tab
nnoremap [SPACE]t :<C-u>tabnew<CR>
nnoremap [SPACE]T <C-w>T
" create pane
nnoremap [SPACE]s :<C-u>sp<CR>
nnoremap [SPACE]v :<C-u>vs<CR>
" quit & save
nnoremap [SPACE]q :<C-u>q<CR>
nnoremap [SPACE]Q :<C-u>bd<CR>
nnoremap [SPACE]W :<C-u>wall<CR>

set splitright

filetype plugin indent on

language en_US.UTF-8
set shortmess+=I
let g:python3_host_prog = expand('~/.pyenv/shims/python')

if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

