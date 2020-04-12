#################################
# malpaw.vagrant.resilio-worker #
# Vagrant configuration         #
#################################

Vagrant.require_version ">=2.0.0"

Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end

	# have to use xenial instead of cosmic until elementary os updates vagrant to >=2.0
	config.vm.box = "ubuntu/xenial64"
	config.vm.hostname = "resilio-worker"

	config.vm.network "forwarded_port", guest: 8888, host: 8888

	config.vm.synced_folder "workspace/", "/home/vagrant/workspace"
	config.vm.provision "shell", path: "provision.sh"
end
