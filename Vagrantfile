# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.7.4"
Vagrant.configure("2") do |config|
  unless Vagrant.has_plugin?("vagrant-vbguest")
    raise 'Install Vagrant VBGuest plugin to keep the tools up to date (vagrant plugin install vagrant-vbguest)'
  end
  # check available ubuntu boxes: https://app.vagrantup.com/ubuntu
  config.vm.box = "ubuntu/trusty64"
  # sync in current directory to get access share micropython sources & generated images
  config.vm.synced_folder ".", "/home/vagrant/sources"
  # configure VM a bit
  config.vm.provider "virtualbox" do |v|
    v.name = "vagrant-micropython"
    v.cpus = 2
    v.memory = 4096
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
    v.check_guest_additions = false
  end
  # set up tooling
  config.vm.provision "packages", type: "shell", privileged: true, path: "providers/packages.sh"
  config.vm.provision "toolchain", type: "shell", privileged: false, path: "providers/toolchain.sh"
  config.vm.provision "micropython", type: "shell", privileged: false, path: "providers/micropython.sh"
  config.vm.provision "profile", type: "shell", privileged: false, path: "providers/profile.sh"
  config.vm.provision "echo", type: "shell", privileged: false, run: "always",
    inline: "echo Build images with 'vagrant provision --provision-with build-image'"
  config.vm.provision "build-image", type: "shell", privileged: false, run: "never", path: "providers/build_image.sh"
end
