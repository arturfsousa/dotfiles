ln -sf `pwd`/.bash_profile ~/.bash_profile
ln -sf `pwd`/.editorconfig ~/.editorconfig
ln -sf `pwd`/.gitconfig ~/.gitconfig
ln -sf `pwd`/.gitignore_global ~/.gitignore_global
ln -sf `pwd`/.pylintrc ~/.pylintrc

# https://medium.com/welcome-to-the-django/guia-definitivo-para-organizar-meu-ambiente-python-a16e2479b753https://medium.com/welcome-to-the-django/guia-definitivo-para-organizar-meu-ambiente-python-a16e2479b753
brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper

pyenv install 2.7.15
pyenv install 3.6.5

# Comment this line in the .bash_profile: pyenv virtualenvwrapper_lazy
pyenv virtualenv 3.6.5 tools3
pyenv virtualenv 2.7.15 tools2

pyenv activate tools3
pip install ipython
pip install pep8
pip install flake8
pip install pylint

pyenv activcate tools2
pip install "your favorite python2 packages..."
# Discomment this line in the .bash_profile: pyenv virtualenvwrapper_lazy

pyenv globals 3.6.5 2.7.15 tools3 tools2

mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
npm install --lts

brew install watchman
brew install yarn

npm install -g npmrc
npmrc
npm login

npmrc -c artifactory
npm config set registry https://artifactory.globoi.com/artifactory/api/npm/npm-repos/
npm login

brew tap tsuru/homebrew-tsuru
brew install tsuru

tsuru target-add default https://tsuru.globoi.com -s
tsuru login

brew install go
