# -*- mode: ruby -*-
# vi: set ft=ruby :

VIRTUAL_HOST_PRIVATE_IP_ADDRESS = "192.168.58.102"
CPU_CORES_COUNT = "8"
MEMORY_COUNT = "8192"
#MASTER_NODES = "1"
#WORKER_NODES = "3"

# create machines config
Vagrant.configure(2) do |config|
    config.vm.box = "bento/debian-11"
    config.vm.provider "virtualbox" do |v|
    config.vm.synced_folder ".", "/mnt", type: "virtualbox"
        # for connect with SSH on both machines with no password
        id_rsa_pub = File.read("#{Dir.home}/.ssh/id_rsa.pub")
        config.vm.provision "copy ssh public key", type: "shell",
        inline: "echo \"#{id_rsa_pub}\" >> /home/vagrant/.ssh/authorized_keys"
    end

  # master node config
    config.vm.define 'debian' do |debian|
        debian.vm.network :private_network,
        ip: VIRTUAL_HOST_PRIVATE_IP_ADDRESS
        debian.vm.hostname = "linux-master"
        debian.vm.synced_folder "game",
        "/home/vagrant/game"
        debian.vm.provision "shell",
        privileged: true, path: "game/setup.sh"
#        args: [MASTER_NODES, WORKER_NODES]
        debian.vm.provider "virtualbox" do |v|
            v.name = "Linux Master"
            v.memory = MEMORY_COUNT
            v.cpus = CPU_CORES_COUNT
        end
    end

end