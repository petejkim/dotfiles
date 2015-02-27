#!/bin/bash
set -e

if [ $(uname) = 'Darwin' ]; then
  is_osx=true
fi

cd $HOME
mkdir -p ~/downloads
mkdir -p ~/workspace

if [ $is_osx ]; then
  echo "Installing Homebrew..."
  if [ ! -e /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update
  brew doctor
  brew install ack axel git macvim tmux wget zsh hg the_silver_searcher
fi

echo "Installing Ruby..."
if [[ ! -e ~/.rbenv ]]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  if [[ ! -e ~/.rbenv/plugins/ruby-build ]]; then
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  fi
fi
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' > ~/.rubyinit
echo 'eval "$(rbenv init -)"' >> ~/.rubyinit
echo 'export PATH=".bundle/binstubs:$PATH"' >> ~/.rubyinit
source ~/.rubyinit
ruby_ver='2.1.4'
if [[ ! -e ~/.rbenv/versions/"$ruby_ver" ]]; then
  rbenv install "$ruby_ver"
  rbenv global "$ruby_ver"
fi
gem install bundler

echo "Installing Node.js..."
if [[ ! -e ~/.nvm ]]; then
  git clone https://github.com/creationix/nvm.git ~/.nvm
fi
echo 'source ~/.nvm/nvm.sh' > ~/.nodeinit
source ~/.nodeinit
node_ver='0.10'
nvm install "$node_ver"
nvm alias default "$node_ver"
npm install -g coffee-script

echo "Installing Go..."
go_ver='1.3.3'
if [[ ! -e ~/.go/"$go_ver" ]]; then
  if [ $is_osx ]; then
    gotar='go'"$go_ver"'.darwin-amd64-osx10.8.tar.gz'
  else
    gotar='go'"$go_ver"'.linux-amd64.tar.gz'
  fi
  curl 'https://storage.googleapis.com/golang/'"$gotar" -o ~/downloads/$gotar
  mkdir -p ~/.go
  rm -rf ~/.go/go
  tar -C ~/.go -xzf ~/downloads/$gotar
  mv ~/.go/go ~/.go/"$go_ver"
fi
ln -fs ~/.go/"$go_ver" ~/.go/current
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
dotfiles_path="$HOME/workspace/dotfiles"
if [[ ! -e "$dotfiles_path" ]]; then
  git clone git@github.com:petejkim/dotfiles.git "$dotfiles_path"
  ln -fs "$dotfiles_path"/home/.ackrc ~/.ackrc
  ln -fs "$dotfiles_path"/home/.bundle ~/.bundle
  ln -fs "$dotfiles_path"/home/.gemrc ~/.gemrc
  ln -fs "$dotfiles_path"/home/.inputrc ~/.inputrc
  ln -fs "$dotfiles_path"/home/.irbrc ~/.irbrc
  ln -fs "$dotfiles_path"/home/.tmux.conf ~/.tmux.conf
  ln -fs "$dotfiles_path"/home/.vimrc ~/.vimrc
  ln -fs "$dotfiles_path"/home/.vim ~/.vim
  ln -fs "$dotfiles_path"/home/.zshrc ~/.zshrc
  cp -n "$dotfiles_path"/home/.gitconfig ~/.gitconfig
fi

echo "Installing Vim Plugins... (this takes a while)"
if [[ ! -e ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qa > /dev/null

echo "DONE!"
