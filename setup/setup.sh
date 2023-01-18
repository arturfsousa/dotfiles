#!/bin/bash

#
# Brew
# ----
#

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install watchman
brew install jq
brew install ack
brew install ag
brew install wrk
brew install tree

#
# Zshell
# ------
#

brew install zsh
chsh -s $(which zsh) # Set as the default shell
brew install antigen

#
# Linking dotfiles
# ----------------
#

# Run inside the setup folder
ln -sf "$(dirname `pwd`)/.zshrc" $HOME/
ln -sf "$(dirname `pwd`)/.bashrc" $HOME/
ln -sf "$(dirname `pwd`)/.bash_profile" $HOME/
ln -sf "$(dirname `pwd`)/.spaceshiprc.zsh" $HOME/
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

pyenv install 3.10.9

# Comment this line in the .bashrc file:
# pyenv virtualenvwrapper_lazy

pyenv virtualenv 3.10.9 tools

pyenv activate tools
pip install ipython
pip install pep8
pip install flake8
pip install pylint
pip install black

# Uncomment this line in the .bashrc file:
# pyenv virtualenvwrapper_lazy

pyenv global 3.10.9 tools

#
# NodeJS
# ------
#

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
npm install --lts

#
# GoLang
# -----------
#

brew install go
