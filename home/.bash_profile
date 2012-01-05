export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:$PATH"

export DISPLAY=":0.0"
export CLICOLOR=1
export MANPATH="/usr/local/man:$MANPATH"
export COPYFILE_DISABLE=true
export ARCHFLAGS='-arch x86_64'
export EDITOR='vim -f'
export NODEPATH="/usr/local/lib/node_modules"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(parse_git_branch)\$ "
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -F'
alias l='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rspec='bundle exec rspec'
alias rspecd='bundle exec rspec --drb'
alias guard='bundle exec guard'

eval "$(rbenv init -)"

