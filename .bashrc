# Global environment
export SHELL=/bin/bash
export EDITOR="vim"
export BROWSER="safari"

# bash
set menu-complete-display-prefix=on
shopt -s nocaseglob;
shopt -s cdspell
shopt -s histappend
shopt -s checkwinsize
#shopt -s autocd

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HOMEBREW_NO_ANALYTICS=1

#
# locale
#
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# pkg config
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:~/usr/lib/pkgconfig
export PKG_CONFIG_PATH

# aliases
alias c='clear'
alias ls='ls -G'
alias ll='ls -alFG'

#exports
PS1='[\u@mac \W]\$ '
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
