# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(“2”) do |config|
  config.vm.box = “ubuntu/bionic64”
  # Bridge network configuration
  config.vm.network “public_network”
  config.vm.provision :shell, inline: <<-SHELL
    # Install last version of Docker
    curl -fsSL https://test.docker.com -o test-docker.sh
    sh test-docker.sh # helper script installs the beta package
    # Add default user in docker group
    usermod -aG docker vagrant
  SHELL
end