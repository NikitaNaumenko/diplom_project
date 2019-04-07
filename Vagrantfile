Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision 'docker'
  config.vm.provision :docker_compose, rebuild: true, yml: 'docker-compose.yml'
end
