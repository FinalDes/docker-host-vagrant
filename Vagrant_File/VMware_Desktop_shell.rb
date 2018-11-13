# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu18.04.1"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "./provision/", "/vagrant/provision",
    type: "nfs",
    nfs_version: 3
  config.vm.provider :vmware_desktop do |vmware|
    vmware.vmx["memsize"] = "2048"
    vmware.vmx["numvcpus"] = "2"
    vmware.whitelist_verified = true
    vmware.vmx["ethernet0.pcislotnumber"] = "32"
  end
  config.vm.provision :shell, inline: <<-SHELL
    # Install last version of Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh # helper script installs the beta package
    # Add default user in docker group
    usermod -aG docker vagrant
  SHELL
end