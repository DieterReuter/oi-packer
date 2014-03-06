vboxmanage controlvm packer-virtualbox-iso poweroff
vboxmanage unregistervm packer-virtualbox-iso --delete
rm -fr "J:/DR-VirtualBox VMs/packer-virtualbox-iso/"
rm -fr output-virtualbox-iso/
