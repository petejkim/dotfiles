#!/bin/bash
set -e

cd $HOME
mkdir -p ~/downloads
mkdir -p ~/workspace

echo "Installing Ruby..."
if [[ ! -e ~/.rbenv ]]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  if [[ ! -e ~/.rbenv/plugins/ruby-build ]]; then
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  fi
fi
echo 'export PATH=".rbenv/bin:$PATH"' > ~/.rubyinit
echo 'eval "$(rbenv init -)"' >> ~/.rubyinit
echo 'export PATH=".bundle/binstubs:$PATH"' >> ~/.rubyinit
source ~/.rubyinit
if [[ ! -e ~/.rbenv/versions/2.1.2 ]]; then
  rbenv install 2.1.2
  rbenv global 2.1.2
fi
gem install bundler

echo "Installing Node.js..."
if [[ ! -e ~/.nvm ]]; then
  git clone https://github.com/creationix/nvm.git ~/.nvm
fi
echo 'source ~/.nvm/nvm.sh' > ~/.nodeinit
source ~/.nodeinit
nvm install v0.10.28
nvm alias default 0.10
npm install -g coffee-script

echo "Installing Go..."
if [[ ! -e ~/.go/1.2.2 ]]; then
  gotar='go1.2.2.linux-amd64.tar.gz'
  curl 'https://storage.googleapis.com/golang/'"$gotar" -o ~/downloads/$gotar
  mkdir -p ~/.go
  rm -rf ~/.go/go
  tar -C ~/.go -xzf ~/downloads/$gotar
  mv ~/.go/go ~/.go/1.2.2
fi
ln -fs ~/.go/1.2.2 ~/.go/current
echo 'export GOROOT="$HOME/.go/current"' > ~/.goinit
echo 'export GOPATH="$HOME/workspace/go"' >> ~/.goinit
echo 'export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"' >> ~/.goinit
source ~/.goinit
go get -u github.com/tools/godep
go get -u code.google.com/p/go.tools/cmd/goimports
go get -u github.com/golang/lint/golint
go get -u github.com/nsf/gocode

echo "Installing Oh-my-zsh..."
if [[ ! -e ~/.oh-my-zsh ]]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

echo "Installing Dotfiles..."
ln -fs /vagrant/home/.ackrc ~/.ackrc
ln -fs /vagrant/home/.bundle ~/.bundle
ln -fs /vagrant/home/.gemrc ~/.gemrc
ln -fs /vagrant/home/.inputrc ~/.inputrc
ln -fs /vagrant/home/.irbrc ~/.irbrc
ln -fs /vagrant/home/.tmux.conf ~/.tmux.conf
ln -fs /vagrant/home/.vimrc ~/.vimrc
ln -fs /vagrant/home/.vim ~/.vim
ln -fs /vagrant/home/.zshrc ~/.zshrc
cp -n /vagrant/home/.gitconfig ~/.gitconfig

echo "Installing Vim Plugins... (this takes a while)"
if [[ ! -e ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qa > /dev/null

echo "DONE!"
