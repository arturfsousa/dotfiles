#
# Basic
# -----
#
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH

# Projects Workspace
export PROJECT_HOME=$HOME/Projects

# Colors
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

#
# Homebrew
# --------
#
[ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion

#
# Python
# ------
#

# Pip
export PIP_REQUIRE_VIRTUALENV=true
export PIP_CONFIG_FILE=$HOME/.pip/pip.conf

# Virtualenv
export VIRTUALENVS_HOME=$HOME/.virtualenvs
export WORKON_HOME=$VIRTUALENVS_HOME

# Pyenv
eval "$(pyenv init -)"
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
# Ruby
# ----
#

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#
# Go
# --
#

export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

#
# VS Code
# -------
#
export PATH="$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"

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
alias egrep="egrep --colour"
alias grep="egrep --colour"
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

#
# General utilities
# -----------------
#

#
# Custom local_profile
# --------------------
#
[ -f $HOME/.local_profile ] && source $HOME/.local_profile

#
# Custom scripts
# --------------
#
[ -f $HOME/shell_functions.sh ] && source $HOME/shell_functions.sh
