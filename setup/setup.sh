#!/bin/bash

#
# Brew
# ----
#

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install watchman
brew install jq
brew install ack
brew install ag
brew install wrk

#
# Zshell
# ------
#

brew install zsh
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting
brew install antigen

#
# Linking dotfiles
# ----------------
#

ln -sf "$(dirname `pwd`)/.zshrc" $HOME/
ln -sf "$(dirname `pwd`)/.bashrc" $HOME/
ln -sf "$(dirname `pwd`)/.bash_profile" $HOME/
ln -sf "$(dirname `pwd`)/.editorconfig" $HOME/
ln -sf "$(dirname `pwd`)/.gitconfig" $HOME/
ln -sf "$(dirname `pwd`)/.gitignore_global" $HOME/
ln -sf "$(dirname `pwd`)/.pylintrc" $HOME/

#
# Python
# ------
#

brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper

pyenv install 2.7.15
pyenv install 3.6.5

# Comment this line in the .rc file:
# pyenv virtualenvwrapper_lazy

pyenv virtualenv 3.6.5 tools3
pyenv virtualenv 2.7.15 tools2

pyenv activate tools3
pip install ipython
pip install pep8
pip install flake8
pip install pylint
pip install black

# Uncomment this line in the .rc file:
# pyenv virtualenvwrapper_lazy

pyenv globals 3.6.5 2.7.15 tools3 tools2

#
# NodeJS
# ------
#

# NVM
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
npm install --lts

# YARN
brew install yarn

#
# GoLang
# -----------
#

brew install go
