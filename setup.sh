#!/bin/sh
set -ux
loadkeys jp106

#----------------------
# partitioning /dev/sda
# * sda1 : EFI Filesystem : 100MB
# * sda2 : SWAP : 4GB
# * sda3 : xfs : 残り
#----------------------
gdisk /dev/sda <<EOF
o
y
n
1

+512M
EF00
n
2

+4G
8200
n
3



w
y
EOF

# format
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2

# mount
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

# mirror
cat > /etc/pacman.d/mirrorlist <<EOF
Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/\$repo/os/\$arch
EOF

# pacstrap
pacstrap /mnt base base-devel

# fstab
genfstab -U -p /mnt >> /mnt/etc/fstab

# chroot
CHROOT="arch-chroot /mnt"

# chroot->locale
$CHROOT sed -i -e 's/#ja_JP.UTF-8/ja_JP.UTF-8/' /etc/locale.gen
$CHROOT sed -i -e 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
echo LANG=ja_JP.UTF-8 > /mnt/etc/locale.conf
$CHROOT locale-gen
echo KEYMAP=jp106 > /mnt/etc/vconsole.conf

# chroot->timezone
$CHROOT ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
$CHROOT hwclock --systohc --utc

$CHROOT hwclock -u -w
$CHROOT passwd

# bootloader
$CHROOT pacman -S grub dosfstools efibootmgr
$CHROOT grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub --recheck --debug
$CHROOT grub-mkconfig -o /boot/grub/grub.cfg
$CHROOT mkdir /boot/EFI/boot
$CHROOT cp /boot/EFI/arch_grub/grubx64.efi  /boot/EFI/boot/bootx64.efi

$CHROOT pacman -S wpa_supplicant dialog

set +x
