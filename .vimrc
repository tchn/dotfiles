set nocompatible
filetype on
filetype plugin on

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

"snipMate
Bundle 'snipMate'

"clang-complete
Bundle 'clang-complete'

"easytags
Bundle 'easytags.vim'

"a
Bundle 'a.vim'

"cocoa.vim
Bundle 'cocoa.vim'

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

"minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"taglist.vim
"" If the exuberant ctags utility is not present in one of the directories in
"" the PATH environment variable, then set the 'Tlist_Ctags_Cmd' variable to
"" point to the location of the exuberant ctags utility (not to the directory)
"" in the .vimrc file.
""for osx/macports
"let Tlist_Ctags_Cmd='/opt/local/bin/ctags'

""for ctags that supports objc
let Tlist_Ctags_Cmd='/$HOME/tools/ctags-ObjC-5.8.1/bin/ctags'
""only for ctags that supports objc
autocmd FileType objc let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'

" ack.vim
" With Debian, ack is provided with a package named 'ack-grep', and ack.vim cannnot find ack executable. Try `ln -s /usr/bin/ack-grep /usr/local/bin/ack`
let g:AckCmd='ack-grep'

" a.vim
" for objc
autocmd FileType objc let g:alternateExtensions_m = "h"
autocmd FileType objc let g:alternateExtensions_h = "m"
