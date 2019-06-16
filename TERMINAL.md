# Terminal Setup

## Zshell

https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e
https://gist.github.com/OliverJAsh/1a7eff33bee819eab4bee9fc8584ecc5

```
brew install zsh

# Set as default shell
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
```

### Manual plugins

```
brew install zsh-completions
rm -f ~/.zcompdump && compinit

brew install zsh-history-substring-search
echo 'source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zshrc

brew install zsh-autosuggestions
echo 'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

brew install zsh-syntax-highlighting
echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
```

### Antigen plugins

```
brew install antigen

# .zshrc
source /usr/local/share/antigen/antigen.zsh

antigen theme denysdovhan/spaceship-prompt

antigen bundle g-plane/zsh-yarn-autocompletions
antigen bundle lukechilds/zsh-better-npm-completion

antigen apply
```

## Iterm

# Color presets

- `Artur.itermcolors`
- https://github.com/nathanbuchar/atom-one-dark-terminal

- Font
  - FiraCode
  - Check Unicode Version 9 Widths
  - Check Threat ambiguous-width characters as double-width

## Prompts

- Pure: https://github.com/sindresorhus/pure
- Spaceship: https://github.com/denysdovhan/spaceship-prompt
