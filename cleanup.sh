#!/bin/sh -x

VBOXDIR=`vboxmanage showvminfo packer-virtualbox-iso | grep "Log folder:" | sed  "s/Log folder: *//g" | sed s,/Logs$,,g`

vboxmanage controlvm packer-virtualbox-iso poweroff
vboxmanage unregistervm packer-virtualbox-iso --delete

if [ -d "$VBOXDIR" ]; then
  sleep 1
  rm -fr "$VBOXDIR"
fi

rm -fr output-virtualbox-iso/
