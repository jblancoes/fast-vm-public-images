### mode (optional)

# export GB_ADD_STEPS=virtualbox
# export GB_ADD_STEPS="virtualbox vagrant"
# export GB_ADD_STEPS=gce
# export GB_ADD_STEPS=aws

### Stage3, portage snapshot

export GB_STAGE3=20210905T170549Z
# this should be ftp, when using latest
#export GB_STAGE3_MIRROR="http://tux.rainside.sk/gentoo/"
#export GB_STAGE3=latest
export GB_STAGE3_MIRROR="ftp://ftp.lanet.kr/pub/gentoo/"
export GB_INIT='systemd'

### Root devices

# used for disk partitioning and grub2 install destination
export GB_ROOTDEVICE=sda
export GB_ROOT=/mnt/gentoo

### Partitioning

#### automatic

# let gentoo-build do disk partitioning and mount
export GB_PARTITIONING=1

# only ext4 and xfs is supported; if xfs has chosen, /boot will be partitioned additional, using ext4
export GB_ROOT_FSTYPE=ext4
# export GB_ROOT_FSTYPE=xfs

# change the default swap partition size
export GB_SWAP_PARTITION_SIZE=256M
export GB_SWAP_PARTITION=4

#### Manually

# Set this to 0 to disable automated partitioning. fstab are still autogenerated.
#  export GB_PARTITIONING=0

# This means /dev/${GB_ROOTDEVICE}2
#  export GB_ROOT_PARTITION=2
#  export GB_ROOT_FSTYPE=ext4

# these variables are optional.
#  export GB_BOOT_PARTITION=1
#  export GB_BOOT_FSTYPE=ext4

### Networking

export GB_HOSTNAME=gentoobox

# if omit, guessed by the active default route
#  export GB_IFACE=eth0
# by default generates DHCP configuration
#  export GB_NETWORK="[Network] Address=192.168.0.10/24 Gateway=192.168.0.1 Domains=corp DNS=8.8.8.8"

### Portage

export GB_REMOVE_PORTAGE=1

### make.conf

#export GB_FEATURES=
#export GB_USE=
#export GB_CFLAGS="-O2 -pipe"
export GB_MIRRORS="http://ftp.lanet.kr/pub/gentoo/"
#export GB_BINPKG_HOST=""

### Linux kernel

export GB_KERNEL_PACKAGE='>=sys-kernel/gentoo-sources-4.0.1'
export GB_KERNEL_CONFIG="https://www.famera.cz/config"

### Default user

#export GB_USER_UID=999
#export GB_USER_LOGIN=gentoo
# optional, if omit, no password given
#export GB_USER_PASSWORD=gentoo-build

### Root user
# optional, if ommited you will need normal user with sudo to access 'root'
export GB_ROOT_USER_PASSWORD=testtest

# skip sudoers
# export GB_SKIP_SUDOERS=1

### Timezone

export GB_TIMEZONE=UTC

### distcc (optional)

# (not implemented)
# export GB_DISTCC_HOSTS=""
# export GB_DISTCC_MAKEOPTS=""

### System profile
export GB_ESELECT_PROFILE="default/linux/amd64/17.1/systemd"

### grub

export GB_GRUB_SERIAL=1
# export GB_GRUB_CONSOLE=1
# export GB_GRUB_NO_TIMEOUT=1
