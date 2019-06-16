source ~/.bash_profile

#
# Basic
# -----
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
# Autosuggestions
# ---------------
#
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#
# Syntax highlight
# ----------------
#
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#
# History search
# --------------
#
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#
# Menu seletion
# -------------
#

# Highlight
zstyle ':completion:*' menu select
# Tag name as group name
zstyle ':completion:*' group-name ''
# Format group names
zstyle ':completion:*' format '%B---- %d%b'

#
# Theme prompt
# ------------
#
# autoload -U promptinit
# promptinit
# prompt spaceship

#
# Word style: directory delimiter
# -------------------------------
#
autoload -U select-word-style
select-word-style bash

#
# Spaceship
# ---------
#
SPACESHIP_VI_MODE_SHOW=false

#
# Antigen
# ---------
#
source /usr/local/share/antigen/antigen.zsh

antigen theme denysdovhan/spaceship-prompt

antigen bundle g-plane/zsh-yarn-autocompletions
antigen bundle lukechilds/zsh-better-npm-completion

antigen apply

#
# Hooks
# -------------------------------
#
autoload -U add-zsh-hook
nvm-auto() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd nvm-auto
nvm-auto
