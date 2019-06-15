source ~/.bash_profile

#
# Basic
# ----------
#

# History
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.histfile"

setopt appendhistory autocd beep extendedglob nomatch notify

setopt SHARE_HISTORY

bindkey -v

#
# Completion
# ----------
#
autoload -Uz compinit
compinit

fpath=(/usr/local/share/zsh-completions $fpath)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

#
# History search
# --------------
#
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#
# Menu seletion
# --------------
#

# Highlight
zstyle ':completion:*' menu select
# Tag name as group name
zstyle ':completion:*' group-name ''
# Format group names
zstyle ':completion:*' format '%B---- %d%b'

#
# Theme
# --------------
#
autoload -U promptinit
promptinit
prompt pure

#
# Word style: directory delimiter
# --------------
#
autoload -U select-word-style
select-word-style bash
