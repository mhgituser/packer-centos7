#
# Minimal Vagrantfile for RedHat_64 system
#

hostname = 'dev.example.com'

Vagrant.configure('2') do |config|
  config.vm.box = "CentOS-7-x86_64-Minimal"
  config.vm.box_url = "build/CentOS-7-x86_64-Minimal.box"

  config.vm.hostname = hostname
  config.vm.provider :virtualbox do |v|
    v.name = hostname
  end
end
