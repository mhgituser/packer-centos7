install
cdrom
lang en_US.UTF-8
keyboard us
network --bootproto=dhcp --hostname=vagrant.localdomain
rootpw vagrant
user --name=vagrant --password=vagrant
firewall --enabled --service=ssh
authconfig --enableshadow --passalgo=sha512
selinux --disabled
timezone UTC
bootloader --location=mbr

text
skipx
zerombr

clearpart --all --initlabel
autopart

auth  --useshadow  --passalgo=sha512
firstboot --disabled
reboot --eject

%packages --ignoremissing
@core
bzip2
deltarpm
dkms
epel-release
gcc
kernel-devel
kernel-headers
make
puppet
-*-firmware
%end

%post --log=/root/ks.log
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
echo "Defaults:vagrant !requiretty" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
mkdir -pm 700 /home/vagrant/.ssh
cat <<EOK >/home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8Y\
Vr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdO\
KLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7Pt\
ixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmC\
P3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW\
yLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOK
cat <<EOF >>/etc/ssh/sshd_config
UseDNS no
GSSAPIAuthentication no
AllowTcpForwarding no
StrictModes yes
PermitTunnel no
PermitRootLogin without-password
EOF
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant.vagrant /home/vagrant/.ssh
%end
