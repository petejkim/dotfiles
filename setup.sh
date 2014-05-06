#!/bin/bash
apt-get install git tmux zsh
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.1.1
rbenv global 2.1.1
git clone https://github.com/creationix/nvm.git ~/.nvm
nvm install v0.10.26
nvm alias default 0.10
