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

# Uncomment the following line to disable command auto-correction.
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export COPYFILE_DISABLE=true

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

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias bi='bundle install'
alias gpom='git push origin master'
alias gpr='git pull --rebase'
alias load_env='export $(cat .env)'
alias rspec='nocorrect rspec'

# ruby
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export PATH=".bundle/binstubs:$HOME/.rbenv/bin:$PATH"

# node
source $(brew --prefix nvm)/nvm.sh

# go
export GOROOT="$(brew --prefix go)"
export GOPATH="$HOME/workspace/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
