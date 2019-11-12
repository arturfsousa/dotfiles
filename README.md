# dotfiles

My personal dotfiles 🤓

## Fonts

[FiraCode](https://github.com/tonsky/FiraCode)

## VSCode

Check the `vscode.json` preferences file.

### Themes

- [One Dark Pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme)
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)

### Python

- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Jinja](https://marketplace.visualstudio.com/items?itemName=wholroyd.jinja)
- [Importmagic](https://marketplace.visualstudio.com/items?itemName=brainfit.vscode-importmagic)

### Javascript

- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Jest](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [TSLint](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-typescript-tslint-plugin)

### GraphQL

- [GraphQL for VSCode](https://marketplace.visualstudio.com/items?itemName=kumar-harsh.graphql-for-vscode)
- [Apollo GraphQL](https://marketplace.visualstudio.com/items?itemName=apollographql.vscode-apollo)

### Docker

- [Docker](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker)

### General

- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Rainbow Brackets](https://marketplace.visualstudio.com/items?itemName=2gua.rainbow-brackets)
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Markdown Lint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [Better TOML](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml)
- [SVG Viewer](https://marketplace.visualstudio.com/items?itemName=cssho.vscode-svgviewer)

## Terminal

### Iterm2

#### Color presets

- `Artur.itermcolors`
- [One Dark Terminal](https://github.com/nathanbuchar/atom-one-dark-terminal)

#### Font

- FiraCode 14pt
- [x] Use ligatures
- [x] Anti-aliased
- [x] Unicode Version 9 Widths
- [x] Ambiguous characters are double-width

- Cursor: Underline
- [x] Blinking cursor

### Brew

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install watchman
brew install jq
brew install ack
brew install ag
brew install wrk
```

### Zshell

Check the `.zshrc` preferences file. There is a separate `.bash_profile` file
to be used in both shells, `.zshrc` includes it anyway.

- [Install Zshell](https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e)
- [Reference Config](https://gist.github.com/OliverJAsh/1a7eff33bee819eab4bee9fc8584ecc5)

```sh
brew install zsh
brew install antigen
brew install antibody

# Set as the default shell
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
```

#### Plugins

You can install plugins manually or by [antigen](https://github.com/zsh-users/antigen)
or [antibody](https://getantibody.github.io/):

##### Prompts

- [Spaceship](https://github.com/denysdovhan/spaceship-prompt)
- [Pure](https://github.com/sindresorhus/pure)

## Python (pyenv)

Don't use the python global bin, use `pyenv` to control any python version and
distribution.

[How to setup pyenv](https://medium.com/welcome-to-the-django/guia-definitivo-para-organizar-meu-ambiente-python-a16e2479b753https://medium.com/welcome-to-the-django/guia-definitivo-para-organizar-meu-ambiente-python-a16e2479b753)

### Setup with Virtualenv Wrapper

```sh
brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper

pyenv install 2.7.15
pyenv install 3.6.5
```

```sh
# Add to your .rc config
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy
```

```sh
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
```

```sh
# Set envs as global respecting the order
pyenv globals 3.6.5 2.7.15 tools3 tools2
```

## NodeJS

### Install yarn

brew install yarn

### Install NVM

```sh
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
npm install --lts
```
