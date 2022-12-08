
ZSH_THEME="tonotdo"

source $HOME/.shellfn
source $HOME/.shellaliases

export CLICOLOR=1
export PAGER='less'
export EDITOR='vim'

unsetopt correct_all

# http://superuser.com/questions/446594/separate-up-arrow-lookback-for-local-and-global-zsh-history
bindkey "^[OA" up-line-or-local-history
bindkey "^[OB" down-line-or-local-history

up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history
down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history
bindkey "^[[1;5A" up-line-or-history    # [CTRL] + Cursor up
bindkey "^[[1;5B" down-line-or-history  # [CTRL] + Cursor down

if [ ! $TERM = dumb ]; then
     # list of plugins from zsh I use
fi
