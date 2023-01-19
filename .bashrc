#
# Basic
# -----
#
export ARCHFLAGS="-arch arm64" # Needed by compilers

# Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Projects Workspace
export PROJECT_HOME=$HOME/Projects

# Colors for ls
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=1

#
# Homebrew
# --------
#

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

[ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion

#
# Python
# ------
#

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Virtualenv
export VIRTUALENVS_HOME=$HOME/.virtualenvs
export WORKON_HOME=$VIRTUALENVS_HOME

# Pip
export PIP_REQUIRE_VIRTUALENV=true
export PIP_CONFIG_FILE=$HOME/.pip/pip.conf

# Pyenv virtualenv
pyenv virtualenvwrapper_lazy

#
# NodeJS
# ------
#

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#
# Go
# --
#

export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

#
# asdf
# ----
#

. $(brew --prefix asdf)/libexec/asdf.sh

#
# Aliases
# -------
#
if [ "$(uname -s)" = "Darwin" ]; then
	alias ls="ls -FG"
else
	alias ls="ls -F --color"
fi

alias cl="clear"
alias l="ls -lAH"
alias la="ls -A"
alias ll="ls -l"
alias clean_pyc="find . -iname '*.pyc' -delete"
alias drun="./manage.py runserver"
alias pup="python ./setup.py sdist upload -q --show-response -r ipypi-local"
alias egrep="egrep -i --colour"
alias grep="egrep -i --colour"
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew" # Fixing pyenv issue with brew doctor https://github.com/pyenv/pyenv#homebrew-in-macos

#
# General utilities
# -----------------
#

#
# Custom local rc
# ---------------
#
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local

#
# Custom scripts
# --------------
#
[ -f $HOME/shell_functions.sh ] && source $HOME/shell_functions.sh
