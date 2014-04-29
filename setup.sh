#!/bin/bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install ack axel git go macvim nvm rbenv ruby-build tmux wget zsh
rbenv install 2.1.1
rbenv global 2.1.1
nvm install v0.10.26
nvm alias default 0.10
