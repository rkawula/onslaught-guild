# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.add_recipe "apt"
      chef.add_recipe "nodejs"
      chef.add_recipe "ruby_build"
      chef.add_recipe "libffi-dev"
      chef.add_recipe "rbenv::user"
      chef.add_recipe "rbenv::vagrant"
      chef.add_recipe "vim"
      chef.add_recipe "mysql::server"
      chef.add_recipe "mysql::client"

      chef.json = {
        rbenv: {
          user_installs: [{
            user: 'vagrant',
            rubies: ['2.2.0'],
            global: '2.2.0',
            gems: {
              '2.2.0' => [{
                name: 'bundler'
              }]
            }
          }]
        },
        mysql: {
          server_root_password: ''
        }
      }
  end

end
