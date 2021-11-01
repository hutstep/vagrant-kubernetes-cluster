Vagrant.configure("2") do |config|

  config.vm.box = "debian/bullseye64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end
  config.vm.provision "shell", path: "provision_upgrade.sh"
  config.vm.provision "shell", path: "provision_pip_deps.sh"
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.createcluster.yml"
    ansible.install_mode = "pip"
    ansible.pip_install_cmd = "curl https://bootstrap.pypa.io/get-pip.py | sudo python3"
    ansible.groups = {
      "cp"       => ["controlplane"],
      "workers"  => ["worker-1", "worker-2"],
      "all:vars" => { "ansible_python_interpreter" => "/usr/bin/python3" }
    }
  end

  config.vm.define "controlplane" do |cp|
    cp.vm.hostname = "controlplane"
    cp.vm.network "private_network", ip: "192.168.111.11"
  end

  (1..2).each do |i|
    config.vm.define "worker-#{i}" do |w|
      w.vm.hostname = "worker-#{i}"
      w.vm.network "private_network", ip: "192.168.111.1#{i + 1}"
    end
  end

end