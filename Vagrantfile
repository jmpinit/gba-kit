# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty32"
    config.vm.provision :shell, path: "setup.sh", args: "vm"
end
