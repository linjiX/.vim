"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    https://github.com/linjiX/.vim                           "
"     _  _          _  _ __  __    __        _                "
"    | |(_) _ __   (_)(_)\ \/ /   / /__   __(_) _ __ ___      "
"    | || || '_ \  | || | \  /   / / \ \ / /| || '_ ` _ \     "
"    | || || | | | | || | /  \  / /_  \ V / | || | | | | |    "
"    |_||_||_| |_|_/ ||_|/_/\_\/_/(_)  \_/  |_||_| |_| |_|    "
"                |__/                                         "
"                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backupdir=.,~/.local/share/vim/backup
set belloff=all
set complete-=i
set cscopeverbose
set directory=~/.local/share/vim/swap//
set display=lastline  " lastline,msgsep
set encoding=utf-8
set fillchars=vert:│,fold:·
set formatoptions=tcqj
set nofsync
set history=10000
set hlsearch
set incsearch
set langnoremap
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set nrformats=bin,hex
set ruler
set sessionoptions-=options
set shortmess+=F
set shortmess-=S
set showcmd
set sidescroll=1
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttimeoutlen=50
set ttyfast
set undodir=~/.local/share/vim/undo
set viminfo+=!
set wildmenu
set wildoptions=tagfile  "pum,tagfile

scriptencoding utf-8

if !isdirectory(&directory)
    call mkdir(&directory, 'p')
endif