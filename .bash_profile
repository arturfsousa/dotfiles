# Git
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

export PS1="$ \w\$(__git_ps1) "

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

# Functions
function work() {
  [ -d $PROJECTS_HOME/$@ ] && cd $PROJECTS_HOME/$@
  [ -d $VIRTUALENVS_HOME/$@ ] && source $VIRTUALENVS_HOME/$@/bin/activate
  [ -d $PROJECTS_HOME/$@/.venv ] && source .venv/bin/activate
  [ -d $PROJECTS_HOME/$@/.env ] && source .env/bin/activate
}

function mysqlmem () {
  mysql.server stop || true
  diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://1165430`
  mysql_install_db --datadir=/Volumes/ramdisk --basedir=`brew --prefix mysql56`
  mysql.server start --datadir=/Volumes/ramdisk
}


# Globo.com
alias clean_db_test="./manage.py dbmigrate --settings=settings_test --drop"
alias thumbor_start="thumbor --conf='thumbor_config.py' --keyfile='thumbor.key' &"

function marketplace_sync () {
  scp -r watcher@riovlb467.globoi.com:/mnt/projetos/deploy-be/gshow/marketplace/* $PROJECTS_HOME/gshow/gshow/marketplace_local
  scp -r watcher@riovlb467.globoi.com:/mnt/projetos/static/et/gs/static/2015/extensoes $PROJECTS_HOME/gshow/gshow/static
}
