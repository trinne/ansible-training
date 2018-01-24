# README
#
# Getting Started:
# 1. vagrant plugin install vagrant-hostmanager
# 2. vagrant up

Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  config.vm.box = "ubuntu/trusty64"

  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys/me.pub"

  config.vm.define "lb01" do |lb|
    lb.vm.network "private_network", ip: "192.168.135.101"
  end

  config.vm.define "app01" do |app|
    app.vm.network "private_network", ip: "192.168.135.111"
  end

  config.vm.define "app02" do |app|
    app.vm.network "private_network", ip: "192.168.135.112"
  end

  config.vm.define "db01" do |db|
    db.vm.network "private_network", ip: "192.168.135.121"
  end
end
