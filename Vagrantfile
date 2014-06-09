# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

$script = <<SCRIPT
echo '#{File.read "#{Dir.home}/.ssh/id_rsa.pub"}' > /home/vagrant/.ssh/authorized_keys
/bin/bash /vagrant/susetup.sh
su -c '/bin/bash /vagrant/setup.sh' vagrant
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'ubuntu'
  config.vm.box = 'nitrous-io/trusty64'

  config.vm.provider 'virtualbox' do |v|
    v.gui = true
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provider 'vmware_fusion' do |v|
    v.gui = true
    v.vmx['memsize'] = '2048'
    v.vmx['numvcpus'] = '2'
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'" # avoids 'stdin: is not a tty' error.
  config.ssh.forward_agent = true
  config.ssh.private_key_path = %w(~/.ssh/id_rsa ~/.vagrant.d/insecure_private_key)
  config.vm.provision 'shell', inline: $script
end
