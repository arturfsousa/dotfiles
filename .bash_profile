# Git
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH

# Projects Workspace
export PROJECT_HOME=$HOME/Projects

# Python
export VIRTUALENVS_HOME=$HOME/.virtualenvs
export WORKON_HOME=$VIRTUALENVS_HOME

export PIP_REQUIRE_VIRTUALENV=true
export PIP_CONFIG_FILE=$HOME/.pip/pip.conf

eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Homebrew
[ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GO
export GOPATH=$HOME/Projects/go

# Visual Studio Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Aliases
alias l="ls -la"
alias clean_pyc="find . -iname '*.pyc' -delete"
alias runserver="./manage.py runserver"
alias upload_pypi="python ./setup.py sdist upload -q --show-response -r ipypi-local"
alias egrep="egrep --colour"
alias grep="egrep --colour"

# Functions
function work() {
  # Activates python virtualenvs projects
  [ -d $PROJECT_HOME/$@ ] && cd $PROJECT_HOME/$@
  [ -d $VIRTUALENVS_HOME/$@ ] && source $VIRTUALENVS_HOME/$@/bin/activate
  [ -d $PROJECT_HOME/$@/.venv ] && source .venv/bin/activate
  [ -d $PROJECT_HOME/$@/.env ] && source .env/bin/activate
}
function complete_work() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=`ls $PROJECT_HOME`

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F complete_work work

function mysqlmem () {
  mysql.server stop || true
  diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://1165430`
  mysql_install_db --datadir=/Volumes/ramdisk --basedir=`brew --prefix mysql56`
  mysql.server start --datadir=/Volumes/ramdisk
}

function parse_git_dirty {
  # Returns "*" if the current git branch is dirty
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

function ps_format {
  # Use color_palette to check color options
  local      COLOR1="\[$(tput setaf 39)\]"
  local      COLOR2="\[$(tput setaf 12)\]"
  local      COLOR3="\[$(tput setaf 6)\]"
  local      COLOR4="\[$(tput setaf 13)\]"
  local      COLOR5="\[$(tput setaf 9)\]"
  local      COLOR6="\[$(tput setaf 77)\]" # Default
  local   END_COLOR="\[$(tput sgr0)\]"
  export PS1="$COLOR1\w$COLOR2\$(__git_ps1)$COLOR5\$(parse_git_dirty) $COLOR1$ $COLOR6"
}
ps_format

function color_palette {
  for C in {0..255}; do
      tput setab $C
      tput setaf 255
      echo -n "   $C    "
  done
  tput sgr0
  echo
}

# Add customizations in a file .local_profile
[ -f $HOME/.local_profile ] && source $HOME/.local_profile

# Custom shell
source ~/shell_functions.sh
