#!/bin/bash
## test if guestfish command is present
which guestfish 2>&1 > /dev/null
if [ "$?" != 0 ]; then
	echo "[!!!] Command 'guestfish' not found (Install it!). Making changes to VM FAILED."
	exit 1
fi
## using direct backend to avoid selinux issues on fedora for now
export LIBGUESTFS_BACKEND=direct
## hostname
VM_HOSTNAME=$(echo $VM_NAME|sed -e 's/\./-/g; s/_/-/g')

guestfish -a "/dev/$THINPOOL_VG/$VM_NAME" -m /dev/f31/root_lv -m /dev/sda1:/boot --selinux <<EOF
sh 'sed -i "s/ONBOOT=no/ONBOOT=yes/" /etc/sysconfig/network-scripts/ifcfg-ens2'
sh 'sed -i "s/.*/$VM_HOSTNAME/" /etc/hostname'
selinux-relabel /etc/selinux/targeted/contexts/files/file_contexts /etc/sysconfig/network-scripts/ifcfg-ens2
selinux-relabel /etc/selinux/targeted/contexts/files/file_contexts /etc/hostname
EOF
