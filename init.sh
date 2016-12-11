#!/bin/sh

# This runs as root after the kickstart reboot.  So the net must be up.

yum -q -y install epel-release deltarpm
yum -q -y update epel-release
yum -q -y install kernel-headers-$(uname -r) kernel-devel-$(uname -r) dkms
yum -q -y install gcc make bzip2 puppet
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
modprobe vboxsf || exit 1
umount /mnt
rm -f /home/vagrant/VBoxGuestAdditions.iso
yum clean all
for file in wtmp messages secure audit/audit.log ; do
  cat /dev/null > /var/log/$file
done
dd if=/dev/zero of=/boot/zero bs=1M
rm -f /boot/zero
dd if=/dev/zero of=/zero bs=1M
rm -f /zero
