# Git
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# Returns "*" if the current git branch is dirty.
function parse_git_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

export PS1="\w\$(__git_ps1)\$(parse_git_dirty) $ "

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Homebrew
[ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
export PIP_CONFIG_FILE=$HOME/.pip/pip.conf

# Virtualenv
export VIRTUALENVS_HOME=$HOME/.virtualenvs

# Virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$VIRTUALENVS_HOME

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# Projects
export PROJECTS_HOME=$HOME/Projects

alias l="ls -la"
alias clean_pyc="find . -iname '*.pyc' -delete"
alias runserver="./manage.py runserver"
alias upload_pypi="python ./setup.py sdist upload -q --show-response -r ipypi-local"

# Functions
function work() {
  [ -d $PROJECTS_HOME/$@ ] && cd $PROJECTS_HOME/$@
  [ -d $VIRTUALENVS_HOME/$@ ] && source $VIRTUALENVS_HOME/$@/bin/activate
  [ -d $PROJECTS_HOME/$@/.venv ] && source .venv/bin/activate
  [ -d $PROJECTS_HOME/$@/.env ] && source .env/bin/activate
}
function complete_work() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=`ls $PROJECTS_HOME`

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

# Add customizations in a file .local_profile
[ -f $HOME/.local_profile ] && source $HOME/.local_profile
