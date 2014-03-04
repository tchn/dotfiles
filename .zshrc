# ~/.zshrc

isdarwin(){
    [[ $OSTYPE == darwin* ]] && return 0
    return 1
}

islinux(){
    [[ $OSTYPE == linux-gnu ]] && return 0
    return 1
}

# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey -e

# Prompt
PROMPT="%# "

# Completion
setopt auto_list

setopt auto_menu
zstyle ':completion:*:default' menu select=1

setopt prompt_subst
setopt list_types
setopt auto_param_slash
setopt mark_dirs
setopt list_packed
setopt auto_param_keys
setopt equals
setopt magic_equal_subst
setopt rec_exact
unsetopt correct

# Changing Directories
setopt auto_pushd
setopt pushd_ignore_dups

# History
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096
setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt histignorespace
setopt histallowclobber

# Expansion and Globbing
setopt extended_glob

# enable color support with some handy aliases
isdarwin && export CLICOLOR=1 && export LSCOLORS=exgxfxdxcxegedabagacad

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)ZLS_COLORS}

# change window title
case $TERM in
    *xterm*)
        precmd() {print -Pn  "\e]0;%M: %~\a"}
        preexec() {print -Pn "\e]0;%M: $2\a"}
        ;;
esac

# autojump if available
if islinux; then
    which autojump > /dev/null 2>&1 && source /usr/share/autojump/autojump.sh && export AUTOJUMP_KEEP_SYMLINKS=1
fi

if isdarwin; then
    export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
    if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
        source /opt/local/etc/profile.d/autojump.sh && AUTOJUMP_KEEP_SYMLINKS=1
    fi
fi

# extra env and alias
source ~/.common_funcs

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cp='cp -v'
alias mv='mv -v'
alias l='ls -al --color=auto'
alias lst='ls -altr --color=auto'

if islinux; then
    export PATH=/usr/local/sbin:/opt/bin:/opt/sbin:$PATH
    export PYTHONSTARTUP=~/.pythonstartup
    source ~/.common_funcs_linux
    alias rm='rm -I -v'
    alias ls='ls --color=auto'
    whichsh && . ~/.common_funcs_zsh    # unless sh is the current shell, import .common_funcs_zsh
fi

if isdarwin; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/man:$MANPATH
    export PYTHONSTARTUP=~/.pythonstartup
    source ~/.common_funcs_darwin
fi

# setup for ruby
## Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

## source chruby if installed
[ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh

# set coredump file to be created
# ulimit -c unlimited

#
#m=modprobe;t=thinkpad_acpi;$m -r $t;$m $t fan_control=1;echo level disengaged >/proc/acpi/ibm/fan
