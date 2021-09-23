# Generated by Anaconda 34.25.0.16
# Generated by pykickstart v3.32
#version=RHEL9
# Shutdown after installation
shutdown
# Use text mode install
text

%post --nochroot
rm -f /mnt/sysimage/etc/NetworkManager/system-connections/*nmconnection
/sbin/fstrim /mnt/sysimage
/sbin/fstrim /mnt/sysimage/boot
%end

%addon com_redhat_kdump --enable --reserve-mb='192M'

%end

# Keyboard layouts
keyboard --xlayouts='us'
# System language
lang en_US.UTF-8

# Use CDROM installation media
cdrom

%packages
@^minimal-environment

%end

firstboot --disable
# Do not configure the X Window System
skipx
# System services
services --disabled="chronyd"

# Generated using Blivet version 3.4.0
ignoredisk --only-use=sda
# Partition clearing information
clearpart --none --initlabel
# Disk partitioning information
part /boot --fstype="xfs" --ondisk=sda --size=500
part pv.1 --fstype="lvmpv" --ondisk=sda --size=1 --grow
volgroup c9vg --pesize=4096 pv.1
logvol / --fstype="xfs" --size=5000 --name=root_lv --vgname=c9vg
logvol swap --fstype="swap" --size=256 --name=swap_lv --vgname=c9vg

timesource --ntp-disable
# System timezone
timezone Europe/London --utc

# Root password
rootpw --plaintext testtest
