# Generated by Anaconda 34.25.0.29
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
-linux-firmware-whence
-linux-firmware
-iwl100-firmware
-iwl1000-firmware
-iwl105-firmware
-iwl135-firmware
-iwl2000-firmware
-iwl2030-firmware
-iwl3160-firmware
-iwl5000-firmware
-iwl5150-firmware
-iwl6000g2a-firmware
-iwl6050-firmware
-iwl7260-firmware
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
part pv.1 --fstype="lvmpv" --ondisk=sda --size=1 --grow
part /boot/efi --fstype="efi" --ondisk=sda --size=200 --fsoptions="umask=0077,shortname=winnt"
part /boot --fstype="xfs" --ondisk=sda --size=512
volgroup a9vg --pesize=4096 pv.1
logvol / --fstype="xfs" --size=5120 --name=root_lv --vgname=a9vg
logvol swap --fstype="swap" --size=256 --name=swap_lv --vgname=a9vg

timesource --ntp-disable
# System timezone
timezone Europe/London --utc

# Root password
rootpw --plaintext testtest
