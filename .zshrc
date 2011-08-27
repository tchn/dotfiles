# ~/.zshrc

isdarwin(){
    [[ $OSTYPE == darwin* ]] && return 0
    return 1
}

islinux(){
    [[ $OSTYPE == linux-gnu ]] && return 0
    return 1
}

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

bindkey -e

# Completion
setopt auto_list

setopt auto_menu
zstyle ':completion:*:default' menu select=1

setopt prompt_subst
setopt list_types
#setopt auto_param_slash
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

# Prompting
PROMPT="%# "

# Expansion and Globbing
setopt extended_glob

# enable color support with some handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    export ZLS_COLORS=$LS_COLORS
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='grep --color=auto'
fi

# change window title
case $TERM in
    *xterm*)
        precmd () {print -Pn  "\e]0;%M: %~\a"}
        ;;
esac

# extra env
islinux && export PYTHONSTARTUP=~/.pythonstartup

if [ isdarwin ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/man:$MANPATH
    export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages:$PYTHONPATH
fi
