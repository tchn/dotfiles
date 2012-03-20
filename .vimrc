set nocompatible
filetype off

set runtimepath+=~/.vim/vundle.git/
call vundle#rc()

"taglist (requires ctag or exeburant ctag)
Bundle 'taglist.vim'

"buffer tab
Bundle 'minibufexpl.vim'

"Ctrl+scroll zoom for gvim
Bundle 'fontzoom.vim'

"matchit
Bundle 'matchit.zip'

"ack.vim
Bundle 'ack.vim'

"L9
Bundle 'L9'

"FuzzyFinder, which depends on L9
Bundle 'FuzzyFinder'

"neocomplecache
Bundle 'neocomplcache'

"snipMate
Bundle 'snipMate'

filetype plugin indent on

set encoding=utf8
set expandtab
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start
"set incsearch
set ignorecase
set hlsearch
set ruler
set wildmenu
set commentstring=\ #\ %s
set foldlevel=0
set clipboard+=unnamed
syntax on
set number
set bg=dark
""
"" for minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
""
"" for taglist.vim
"" below is for osx/macports
"let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
let Tlist_inc_Winwidth=0

" With Debian, ack is provided with a package named 'ack-grep', and ack.vim cannnot find ack executable. Try `ln -s /usr/bin/ack-grep /usr/local/bin/ack`
let g:AckCmd='ack-grep'
