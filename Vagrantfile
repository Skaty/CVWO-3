# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile derived from Vagrantfile provided by GoRails

VAGRANTFILE_API_VERSION = "2"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Ubuntu Trusty 14.04 LTS
  config.vm.box = "ubuntu/trusty64"

  # Allocate additional RAM to the VM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Rails server port to our host machinee
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Use Chef Solo as provisioner

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::user"
    chef.add_recipe "rbenv::vagrant"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::client"

    chef.json = {
      rbenv: {
        user_installs: [{
          user: 'vagrant',
          rubies: ["2.2.1"],
          global: "2.2.1",
          gems: {
            "2.2.1" => [
              { name: "bundler" }
            ]
          }
        }]
      },
      # postgresql: {
      #   users: [
      #     {
      #       username: 'root',
      #       password: 'secret',
      #       superuser: true,
      #       replication: false,
      #       createdb: true,
      #       createrole: false,
      #       inherit: true,
      #       replication: false,
      #       login: true
      #     }
      #   ]
      # }
    }
  end
end
