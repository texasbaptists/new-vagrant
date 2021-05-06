# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # Official Ubuntu 20.10 (Groovy Gorilla) builds
    config.vm.box = "ubuntu/groovy64"

    # admin is needed for etc/hosts file on computer
    config.vm.allow_hosts_modification = false

    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "private_network", ip: "192.168.33.11"

    # mount_options for permissions issues on virtual machine
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=766"]

    config.vm.provider "virtualbox" do |vb|
        vb.memory = 4000
        vb.cpus = 2
    end

    # loads all the technology on top of base ubuntu box
    config.vm.provision "shell", path: "vagrant-bootstrap.sh"

end
