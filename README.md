# dotfiles

My personal dotfiles 🤓

## Fonts

[FiraCode](https://github.com/tonsky/FiraCode)

## VSCode

Check the `vscode.json` preferences file.

### Themes

- [Dracula Official](https://marketplace.visualstudio.com/items?itemName=dracula-theme.theme-dracula)
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
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Markdown Lint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [Better TOML](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml)
- [SVG Viewer](https://marketplace.visualstudio.com/items?itemName=cssho.vscode-svgviewer)

## Terminal

### Iterm2

https://iterm2.com/

#### Color presets

- `Artur.itermcolors`
- [Dracula Iterm](https://draculatheme.com/iterm)

#### Font

- FiraCode 14pt
- [x] Use ligatures
- [x] Anti-aliased
- [x] Unicode Version 9 Widths

- Cursor: Underline
- [x] Blinking cursor

### Brew

https://brew.sh/

```sh
brew install watchman
brew install jq
brew install ack
brew install ag
brew install wrk
brew install tree
```

### Zshell

Check the `.zshrc` preferences file. There is a separate `.bash_profile` file
to be used in both shells, `.zshrc` includes it anyway.

- [Install Zshell](https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e)
- [Reference Config](https://gist.github.com/OliverJAsh/1a7eff33bee819eab4bee9fc8584ecc5)

```sh
brew install zsh
chsh -s $(which zsh) # Set as the default shell

brew install antigen
```

#### Plugins

You can install plugins manually or using [antigen](https://github.com/zsh-users/antigen):

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
```

```sh
# Add to your .bashrc
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

```sh
# Comment this line in the .bashrc:
# pyenv virtualenvwrapper_lazy

pyenv install 3.10.9
pyenv virtualenv 3.10.9 tools

pyenv activate tools
pip install ipython
pip install pep8
pip install flake8
pip install pylint
pip install black

# Uncomment this line in the .bashrc:
# pyenv virtualenvwrapper_lazy

# Set envs as global respecting the order
pyenv globals 3.10.9 tools
```

## NodeJS

Follow https://github.com/nvm-sh/nvm
