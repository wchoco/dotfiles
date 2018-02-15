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
colorscheme elflord "カラースキーム
highlight LineNr ctermfg=darkred "行番号の色
set backspace=2 "backspaceで削除できるようにする

" number, paste切り替え
nnoremap <silent> <C-j> :set number!<CR>
nnoremap <silent> <C-p> :set paste!<CR>

nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>

" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


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

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
