source ~/.bashrc

#
# Basic
# -----
#

# Setup
setopt auto_cd
setopt beep
setopt extended_glob
setopt nomatch
setopt notify
setopt correct_all

# Key bindings
bindkey -e

# Delete
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '^?' backward-delete-char

# History
bindkey '^r' history-incremental-search-backward

# Cursor move
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line
fi

#
# History
# ----------
#
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.histfile"

setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

#
# Autocompletion
# ----------
#
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

# Menu
setopt auto_list
setopt auto_menu
setopt always_to_end

# Maches
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Highlight
zstyle ':completion:*' menu select=2

# Tag name as group name
zstyle ':completion:*' group-name ''

# Format group names
zstyle ':completion:*' format '%B---- %d%b'

#
# Antigen
# ---------
#
source $(brew --prefix)/share/antigen/antigen.zsh

#
# Prompt theme
# ------------

# https://github.com/spaceship-prompt/spaceship-prompt
antigen theme spaceship-prompt/spaceship-prompt

#
# Spaceship
# ---------
# ~/.spaceshiprc.zsh

#
# History substring search
# ------------------------
#
antigen bundle zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#
# Syntax highlight
# ----------------
#
antigen bundle zdharma-continuum/fast-syntax-highlighting

#
# Autosuggestions
# ---------------
#
antigen bundle zsh-users/zsh-autosuggestions

#
# Additional completions
# ----------------------
#
antigen bundle zsh-users/zsh-completions

antigen bundle lukechilds/zsh-better-npm-completion

antigen apply
