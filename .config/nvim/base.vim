" -----------------------------------------------------------------------------
" Basic Settings
" -----------------------------------------------------------------------------

let mapleader=" "
let maplocalleader=" "

set autoindent
set autoread
set backspace=indent,eol,start
" set backupdir=/tmp//,.
set clipboard=unnamedplus
set colorcolumn=88
set complete+=kspell
set completeopt=menuone,preview
" set cryptmethod=blowfish2
set cursorline
" set directory=/tmp//,.
set encoding=utf-8
" set expandtab smarttab
set formatoptions=tcqrn1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:> " Use % to jump between pairs
set mmp=5000
set modelines=2
set mouse=a
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
"set nospell
set spelllang=en,gr
set nostartofline
"set number relativenumber
set regexpengine=1
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set tabstop=2
set textwidth=0
set ttimeout
set ttyfast
"set ttymouse=sgr
" set undodir=/tmp
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
set wrap

" TODO: check the following
"
" runtime! macros/matchit.vim
"
" hi SpellBad cterm=underline ctermfg=9
" hi SpellLocal cterm=underline ctermfg=9
" hi SpellRare cterm=underline ctermfg=9
" hi SpellCap cterm=underline
