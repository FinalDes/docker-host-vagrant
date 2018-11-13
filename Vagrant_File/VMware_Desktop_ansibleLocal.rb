# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu18.04.1"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  # config.vm.synced_folder "./dist/", "/home/vagrant/site",
    # type: "nfs",
    # nfs_version: 3
  config.vm.synced_folder "./provision/", "/vagrant/provision",
    type: "nfs",
    nfs_version: 3
  config.vm.provider :vmware_desktop do |vmware|
    vmware.vmx["memsize"] = "2048"
    vmware.vmx["numvcpus"] = "2"
    vmware.whitelist_verified = true
    vmware.vmx["ethernet0.pcislotnumber"] = "32"
  end
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "provision/playbook.yml"
  end
end