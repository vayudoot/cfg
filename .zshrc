
export ZSH=/Users/ntrivedi/.oh-my-zsh

ZSH_THEME="tonotdo"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zsh_reload dnote)

source $ZSH/oh-my-zsh.sh

source $HOME/.shellfn
source $HOME/.shellaliases
source $HOME/miniconda3/etc/profile.d/conda.sh

export CLICOLOR=1
export PAGER='less'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
  # some more ssh stuff
fi

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

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

RPROMPT=""

eval "$(rbenv init -)"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
