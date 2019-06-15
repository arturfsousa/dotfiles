# Terminal Setup

## Zshell

https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e

```
brew install zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

brew install zsh-completions
rm -f ~/.zcompdump && compinit

brew install zsh-history-substring-search
echo 'source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zshrc
```

## Pure

https://github.com/sindresorhus/pure
