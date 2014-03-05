#!/bin/sh

echo "Creating Vagrant user 'vagrant'"
useradd -m -k /etc/skel/ -b /export/home -s /usr/bin/bash vagrant
passwd -N vagrant

echo "Setting Vagrant password to 'vagrant'"
/usr/bin/expect <<INLINE
spawn /usr/bin/passwd vagrant
expect "New Password:"
send "vagrant\n"
expect "Re-enter new Password:"
send "vagrant\n"
expect eof
INLINE

echo "Installing VirtualBox Guest Additions"
echo "mail=\ninstance=overwrite\npartial=quit" > /tmp/noask.admin
echo "runlevel=nocheck\nidepend=quit\nrdepend=quit" >> /tmp/noask.admin
echo "space=quit\nsetuid=nocheck\nconflict=nocheck" >> /tmp/noask.admin
echo "action=nocheck\nbasedir=default" >> /tmp/noask.admin
mkdir -p /mnt/vbga
VBGADEV=`lofiadm -a VBoxGuestAdditions.iso`
mount -o ro -F hsfs $VBGADEV /mnt/vbga
pkgadd -a /tmp/noask.admin -G -d /mnt/vbga/VBoxSolarisAdditions.pkg all
umount /mnt/vbga
lofiadm -d $VBGADEV
rm -f VBoxGuestAdditions.iso

echo "Adding Vagrant user to sudoers"
echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
echo 'Defaults env_keep += "SSH_AUTH_SOCK"' >> /etc/sudoers
chmod 0440 /etc/sudoers

# setup the vagrant key
# you can replace this key-pair with your own generated ssh key-pair
echo "Setting the Vagrant ssh pub key"
mkdir -p /export/home/vagrant/.ssh
chmod 700 /export/home/vagrant/.ssh
chown vagrant:other /export/home/vagrant/.ssh
touch /export/home/vagrant/.ssh/authorized_keys
curl -skL http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub > \
    /export/home/vagrant/.ssh/authorized_keys
chmod 600 /export/home/vagrant/.ssh/authorized_keys
chown vagrant:other /export/home/vagrant/.ssh/authorized_keys

## remove root login from sshd
#echo "Removing root login over SSH"
#sed -i -e "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
#svcadm restart ssh

# update grub menu to lower timeout to 5 seconds
echo "Updating Grub boot menu"
sed -i -e 's/^timeout.*$/timeout 5/' /rpool/boot/grub/menu.lst

# Reset resolv.conf
echo "Resetting resolv.conf"
echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo "Post-install done"
