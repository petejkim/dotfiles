[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

#export DISPLAY=":0.0"
export CLICOLOR=1
#export MANPATH="/usr/local/man:$MANPATH"
#export COPYFILE_DISABLE=true
export ARCHFLAGS='-arch x86_64'
export EDITOR='vim -f'

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

#export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(parse_git_branch)\$ "
#export PS1="\[\033[38;5;64m\]\u@\h\[\033[00m\]:\[\033[38;5;37m\]\w\[\033[38;5;136m\]\$(parse_git_branch)\[\033[38;5;160m\]\$\[\033[00m\] "
export PS1="\[\033[38;5;33m\]\u@\h\[\033[38;5;64m\]:\[\033[38;5;37m\]\w\[\033[38;5;136m\]\$(parse_git_branch)\[\033[38;5;160m\]\$\[\033[00m\] "

#export LSCOLORS=gxfxcxdxbxegedabagacad
#alias ls='ls -F'
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias l='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias bi='bundle install'
alias gpom='git push origin master'
alias gpr='git pull --rebase'
alias load_env='export $(cat .env)'

if [[ -z $TMUX ]]; then
  export PATH="$GOPATH/bin:$GOROOT/bin:$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  export PATH=".bundle/binstubs:$PATH"
fi

#export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. ~/.nvm/nvm.sh

# ssh agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

