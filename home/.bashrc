export PATH=".bundle/bin:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:$PATH"

export DISPLAY=":0.0"
export CLICOLOR=1
export MANPATH="/usr/local/man:$MANPATH"
export COPYFILE_DISABLE=true
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

export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -F'
alias l='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias bi='bundle install --binstubs=.bundle/bin'
alias gpom='git push origin master'
alias gpr='git pull --rebase'

eval "$(rbenv init -)"

. ~/.nvm/nvm.sh
