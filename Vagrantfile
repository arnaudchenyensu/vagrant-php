# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "precise64"

  # Forward the default http port on your host machine port 8080
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder "webserver", "/webserver"

  # Configure puppet
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
    puppet.module_path = "modules"
  end

end
