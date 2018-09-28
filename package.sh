#!/bin/sh
set -ux

CHROOT="arch-chroot /mnt"
$CHROOT pacman -S python3 python-pip neovim alacritty git tmux zsh vim go

# desktop
$CHROOT pacman -S xorg-server xorg-apps xorg-xinit
$CHROOT pacman -S mesa
$CHROOT pacman -S xf86-video-intel
$CHROOT pacman -S xf86-input-synaptics
$CHROOT pacman -S xfce4 xfce4-goodies
$CHROOT pacman -S lightdm lightdm-gtk-greeter
$CHROOT systemctl enable lightdm.service

$CHROOT pacman -S otf-ipafont

$CHROOT pacman -S fcitx-im fcitx-configtool fcitx-mozc

$CHROOT echo "export GTK_IM_MODULE=fcitx" > $HOME/.xprofile
$CHROOT echo "export QT_IM_MODULE=fcitx" >> $HOME/.xprofile
$CHROOT echo 'export XMODIFIERS="@im=fcitx"' >> $HOME/.xprofile

$CHROOT pacman -S firefox

$CHROOT pacman -Sy --noconfirm git base-devel
$CHROOT git clone https://aur.archlinux.org/google-chrome.git
$CHROOT cd google-chrome
$CHROOT makepkg -s --noconfirm
$CHROOT pacman -U --noconfirm google-chrome-*.pkg.tar.xz
$CHROOT pacman -Sy --noconfirm ttf-sazanami

$CHROOT echo "---------"
$CHROOT echo "finished."
$CHROOT echo "---------"

set +x
