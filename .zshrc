## Zsh specific

export ZDOTDIR=$HOME/.config/zsh
export ZPLUGINDIR=$ZDOTDIR/plugins
source $ZDOTDIR/zsh-functions

autoload -Uz colors && colors
autoload -U compinit && compinit

setopt HIST_IGNORE_DUPS
HISTFILE=~/.zsh_history
HISTSIZE="128000"
SAVEHIST="128000"

zsh_add_file "zsh-prompt"

# plugins
zsh_add_plugin "romkatv/zsh-defer"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zap-zsh/supercharge"
zsh_add_plugin "zap-zsh/vim"
zsh_add_plugin "zap-zsh/zap-prompt"
zsh_add_plugin "zap-zsh/fzf"
zsh_add_plugin "zap-zsh/exa"
# load this last
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# keybinds
bindkey '^ ' autosuggest-accept
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

powerline-daemon -q
#[ -f /usr/share/powerline/bindings/zsh/powerline.zsh ] && source /usr/share/powerline/bindings/zsh/powerline.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

## Generic
source $HOME/.shellfn
source $HOME/.shellaliases

export CLICOLOR=1
export PAGER='less'
export EDITOR='vim'

export PATH="$HOME/.local/bin":$PATH
