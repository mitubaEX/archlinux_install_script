#!/bin/sh
set -ux

CHROOT="arch-chroot /mnt"
$CHROOT pacman -S python3 python-pip neovim alacritty git tmux

# desktop
$CHROOT pacman -S xorg-server xorg-server-utils xorg-xinit
$CHROOT pacman -S mesa
$CHROOT pacman -S xf86-video-intel
$CHROOT pacman -S xf86-input-synaptics
$CHROOT pacman -S xfce4 xfce4-goodies
$CHROOT pacman -S lightdm lightdm-gtk-greeter
$CHROOT systemctl enable lightdm.service

$CHROOT pacman -S otf-ipafont

$CHROOT pacman -S fcitx-im fcitx-configtool fcitx-mozc

$CHROOT echo "export GTK_IM_MODULE=fcitx" > $HOME/.xprofile
$CHROOT echo export 'QT_IM_MODULE=fcitx' >> $HOME/.xprofile
$CHROOT echo export 'XMODIFIERS="@im=fcitx"' >> $HOME/.xprofile

$CHROOT pacman -S firefox

$CHROOT echo "---------"
$CHROOT echo "finished."
$CHROOT echo "---------"

set +x
