Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "mysqltest.local"
  config.vm.provision "shell", path: "provision.sh"
end
