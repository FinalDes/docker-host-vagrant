# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(“2”) do |config|
  config.vm.box = “ubuntu/bionic64”
  # Bridge network configuration
  config.vm.network “public_network”
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provision/playbook.yml"
  end
end