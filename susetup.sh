#!/bin/bash
set -e

if [ $(uname) = 'Darwin' ]; then
  is_osx=true
fi

# if not osx
if [ -z $ios_osx ]; then
  if [[ ! -e /etc/ssh/.ssh_regen_done ]]; then
    sed -ri 's|PermitRootLogin without-password|PermitRootLogin no|' /etc/ssh/sshd_config
    sed -ri 's|#PasswordAuthentication yes|PasswordAuthentication no|' /etc/ssh/sshd_config
    echo "Regenerating host SSH keys..."
    rm -rf /etc/ssh/ssh_host_*
    ssh-keygen -A
    echo "Generating an SSH key for user..."
    mkdir -p /home/vagrant/.ssh
    chmod 0700 /home/vagrant/.ssh
    ssh-keygen -b 2048 -t rsa -C 'vagrant@ubuntu' -f /home/vagrant/.ssh/id_rsa -N ''
    chown -R vagrant:vagrant /home/vagrant/.ssh
    service ssh restart
    touch /etc/ssh/.ssh_regen_done
  fi

  echo "Installing essential packages..."
  apt-get update
  apt-get install -yy --no-install-recommends lxc build-essential curl git tmux zsh mercurial ack-grep silversearcher-ag libssl-dev libyaml-dev libreadline6-dev zlib1g-dev docker.io
  chsh -s `which zsh` vagrant
fi
