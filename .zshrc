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
# source /usr/local/share/antigen/antigen.zsh

#
# Antibody
# --------
#
source <(antibody init)

#
# Syntax highlight
# ----------------
#
# antigen bundle zdharma/fast-syntax-highlighting
antibody bundle zdharma/fast-syntax-highlighting

#
# Autosuggestions
# ---------------
#
# antigen bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-autosuggestions

#
# History search
# --------------
#
# antigen bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#
# Additional completions
# ----------------------
#
# antigen bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions

# antigen bundle buonomo/yarn-completion
antibody bundle buonomo/yarn-completion

# antigen bundle lukechilds/zsh-better-npm-completion
antibody bundle lukechilds/zsh-better-npm-completion

#
# Prompt theme
# ------------
#
# antigen theme denysdovhan/spaceship-prompt
# antibody bundle denysdovhan/spaceship-prompt

# Pure
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

# Dracula
# antibody bundle dracula/zsh

#
# Spaceship
# ---------
#
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

#
# Hooks
# -------------------------------
#
# autoload -U add-zsh-hook
# nvm-auto() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd nvm-auto
# nvm-auto


# antigen apply
