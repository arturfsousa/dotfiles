source ~/.bash_profile

plugins=()

# Basic
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End Basic

# Completions
zstyle :compinstall filename '/Users/artur/.zshrc'

autoload -Uz compinit
compinit

fpath=(/usr/local/share/zsh-completions $fpath)
# End Completions

# History search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# End search

# pure
autoload -U promptinit; promptinit
prompt pure
# End pure
