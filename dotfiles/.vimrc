set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
" Git の差分を表示
Plugin 'airblade/vim-gitgutter'
" vim 上で git 操作ができるようにする
Plugin 'tpope/vim-fugitive'
" ファイルをツリー表示
Plugin 'scrooloose/nerdtree'
" ファイルファインダー
Plugin 'ctrlpvim/ctrlp.vim'
" 括弧をペアで入力
Plugin 'jiangmiao/auto-pairs'
" ホワイトスペースの可視化
Plugin 'bronson/vim-trailing-whitespace'
" gcc でコメント・アンコメント
Plugin 'tomtom/tcomment_vim'
" インデントの可視化
Plugin 'nathanaelkane/vim-indent-guides'
" 括弧のペアをカラーで表示
Plugin 'luochen1990/rainbow'
" yml プラグイン
Plugin 'chase/vim-ansible-yaml'

" 各言語のplugin
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'

call vundle#end()
filetype plugin indent on

" NERDTreeToggleのショートカット設定
map <C-n> :NERDTreeToggle<CR>

" 見た目系
" syntax highlightの導入
:set term=xterm-256color
:syntax on
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" vim-indent-guidesの設定
set tabstop=2 shiftwidth=2 expandtab
" luochen1990/rainbowの設定（括弧に色をつける
let g:rainbow_active = 1

" gitgutter
set updatetime=250
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➤'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_sign_modified_removed = "➜"
autocmd Vimenter,Colorscheme * :hi GitGutterAddLine ctermfg=none ctermbg=17
autocmd Vimenter,Colorscheme * :hi GitGutterChangeLine ctermfg=none ctermbg=53
autocmd Vimenter,Colorscheme * :hi GitGutterDeleteLine ctermfg=none ctermbg=52
autocmd Vimenter,Colorscheme * :hi GitGutterChangeDeleteLine ctermfg=none ctermbg=53

" backspaceの有効化
set backspace=indent,eol,start
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" clipboardの設定
set clipboard=unnamed
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" キーマップ変更

" インサートモードにおいて行末へ移動（emacs）
inoremap <C-e> <C-o>$
" インサートモードにおいて行頭へ移動（emacs）
inoremap <C-a> <C-o>^
" ノーマルモードにおいて行末へ移動（emacs）
nnoremap <C-e> $
" ノーマルモードにおいて行頭へ移動（emacs）
nnoremap <C-a> ^