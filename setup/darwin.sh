#!/bin/bash -e

# Fast keyboard repeat rate
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 1

# Disable the character accent menu and enable key repeat
defaults write -g ApplePressAndHoldEnabled -bool false
