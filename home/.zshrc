# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="garyblessington"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export GOROOT="$HOME/.go/current"
export GOPATH="$HOME/workspace/go"

if [[ -z $TMUX ]]; then
  export PATH=".bundle/binstubs:$GOPATH/bin:$GOROOT/bin:$HOME/.rbenv/bin:$PATH"
fi

export DISPLAY=":0.0"
export CLICOLOR=1
export ARCHFLAGS='-arch x86_64'
export EDITOR='vim -f'

export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -F'
alias l='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias bi='bundle install'
alias gpom='git push origin master'
alias gpr='git pull --rebase'
alias load_env='export $(cat .env)'
alias rspec='nocorrect rspec'

eval "$(rbenv init - zsh)"

. ~/.nvm/nvm.sh
