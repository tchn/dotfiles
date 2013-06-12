"------------------------------------------------------------
"" Features {{{1
"
"" These options and commands enable some very useful features in Vim, that no user should have to live without.
"
" " Set 'nocompatible' to ward off unexpected things that your distro might have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
"
" " Attempt to determine the type of a file based on its name and possibly its contents. Use this to allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific.
filetype indent plugin on
"
" " Enable syntax highlighting: syntax on overrides custom colorscheme by vim default scheme
syntax enable
"syntax on

"------------------------------------------------------------
"" Must have options {{{1
"
"" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files in the same editor window. Users can use multiple split windows or multiple tab pages to edit multiple files, but it is still best to enable an option to allow easier switching between files. One such option is the 'hidden' option, which allows you to re-use the same window and switch from an unsaved buffer without saving it first. Also allows you to keep an undo history for multiple files when re-using the same window  in this way. Note that using persistent undo also lets you undo in multiple files even in the same window, but is less efficient and is actually designed for keeping undo history after closing Vim entirely. Vim will complain if you try to quit without saving, and swap files will keep you safe if your computer crashes.
set hidden
"
" Note that not everyone likes working this way (with the hidden option). Alternatives include using tabs or split windows instead of re-using the same window as mentioned above, and/or either of the following options:
"set confirm
"set autowriteall
"
" Better command-line completion
set wildmenu
"
" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see
" the mapping of <C-L> below)
set hlsearch
"
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
"
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
"
" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
"
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
"
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
"
" Always display the status line, even if only one window is displayed
set laststatus=2
"
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
"set confirm
"
" Use visual bell instead of beeping when doing something wrong
set visualbell
"
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
"
" Enable use of the mouse for all modes
set mouse=a
"
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
"
" Display line numbers on the left
set number
"
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
"
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

"------------------------------------------------------------
"" Indentation options {{{1
"
"" Indentation settings according to personal preference.
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4

"------------------------------------------------------------
"" Mappings {{{1
"
"" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
"
" " Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"" Others
set encoding=utf8
set textwidth=0
"set incsearch
set commentstring=\ #\ %s
set foldlevel=0
set clipboard+=unnamed
set background=dark
set statusline=2

" Navigations using keys up/down/left/right
" Disabling default keys to leaen the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" override read-only permission by using sudo
cmap w!! %!sudo tee > /dev/null %

" color scheme
colorscheme jellybeans
"colorscheme default

" include man.vim to enable Man command
runtime ftplugin/man.vim
nmap K :Man <cword><CR>
"let $GROFF_NO_SGR=1

" for plugins managed via vundle
set runtimepath+=~/.vim/vundle.git/
call vundle#rc()

"taglist (requires ctag or exeburant ctag)
"Bundle 'taglist.vim'
""" below is for osx/macports
""let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
"let Tlist_inc_Winwidth=0

"buffer tab
Bundle 'minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"Ctrl+scroll zoom for gvim
Bundle 'fontzoom.vim'

"matchit
Bundle 'matchit.zip'

"closetag.vim
Bundle 'closetag.vim'

"ack.vim
Bundle 'ack.vim'
" With Debian, ack is provided with a package named 'ack-grep', and ack.vim cannnot find ack executable. Try `ln -s /usr/bin/ack-grep /usr/local/bin/ack` because somehow the below does not work.
"let g:AckCmd='/usr/bin/ack-grep'
"let g:ackprg='ack-grep -H --nocolor --nogroup'

"surround.vim
Bundle 'surround.vim'

"simple-pairs
"Bundle 'simple-pairs'

"a.vim
Bundle 'a.vim'

"Command-T (needs vim compiled with Ruby support)
Bundle 'Command-T'
let g:CommandTAlwaysShowDotFiles = 1

"Syntastic
Bundle 'Syntastic'

"snipMate
Bundle 'snipMate'

"fugitive.vim
Bundle 'fugitive.vim'

"git.zip
Bundle 'git.zip'

"ctrlp.vim
Bundle 'ctrlp.vim'

"The-NERD-tree
Bundle 'The-NERD-tree'

"neocomplcache
Bundle 'neocomplcache'
"Setting example at https://github.com/Shougo/neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1

"The-NERD-Commenter
Bundle 'The-NERD-Commenter'

"Tagbar ( requires ctag or exeburant-ctag )
Bundle 'Tagbar'

" Gundo (needs vim compiled with Python support)
Bundle 'Gundo'

" TaskList.vim
Bundle 'TaskList.vim'

" SuperTab
Bundle 'SuperTab'
"au Filetype python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

"colorschemes
" Solarized
" Bundle 'Solarized'

"colorscheme
"jellybeans
Bundle 'jellybeans.vim'

"vinaries
Bundle 'Shougo/vinarise'
Bundle 's-yukikaze/vinarise-plugin-peanalysis'

"cscope_maps
Bundle 'tchn/cscope_maps'

"autoload_cscope.vim
Bundle 'autoload_cscope.vim'

"previm
Bundle 'kannokanno/previm'
let g:previm_open_cmd = 'firefox'
