Vagrant.configure("2") do |config|

  config.vm.box = "debian/bullseye64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end
  config.vm.provision "shell", path: "provision_upgrade.sh"

  config.vm.define "controlplane" do |cp|
    cp.vm.hostname = "controlplane"
    cp.vm.network "private_network", ip: "192.168.111.11"
    cp.vm.provision "shell", path: "provision_pip_deps.sh"
    cp.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook.createcluster.yml"
      ansible.install_mode = "pip"
      ansible.pip_install_cmd = "curl https://bootstrap.pypa.io/get-pip.py | sudo python3"
      ansible.groups = {
        "cp" => ["controlplane"],
        "all:vars" => {
          "ansible_python_interpreter" => "/usr/bin/python3"
        }
      }
    end
  end

end