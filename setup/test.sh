#!/bin/bash

ln -sf "$(dirname `pwd`)/.zshrc" $HOME/
ln -sf "$(dirname `pwd`)/.bash_profile" $HOME/
ln -sf "$(dirname `pwd`)/.editorconfig" $HOME/
ln -sf "$(dirname `pwd`)/.gitconfig" $HOME/
ln -sf "$(dirname `pwd`)/.gitignore_global" $HOME/
ln -sf "$(dirname `pwd`)/.pylintrc" $HOME/
