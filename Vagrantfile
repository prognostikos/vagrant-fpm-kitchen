# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "fpm-oven"
  config.vm.box      = "opscode-ubuntu-12.04"
  config.vm.provision :shell, :path => 'build-packages'
end
