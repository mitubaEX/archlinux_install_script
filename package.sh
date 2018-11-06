#!/bin/sh
set -ux

sudo pacman -S python3 python-pip neovim alacritty git tmux zsh vim go i3 feh compton fzf gnome-keyring dmenu pulseaudio pavucontrol xfce4-pulseaudio-plugin pamixer evince texlive-langjapanese texlive-most ghostscript evince poppler-data exa rofi

# desktop
sudo pacman -S xorg-server xorg-apps xorg-xinit mesa xf86-video-intel xf86-input-synaptics xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

sudo pacman -S otf-ipafont fcitx-im fcitx-configtool fcitx-mozc

sudo echo "export GTK_IM_MODULE=fcitx" > $HOME/.xprofile
sudo echo "export QT_IM_MODULE=fcitx" >> $HOME/.xprofile
sudo echo 'export XMODIFIERS="@im=fcitx"' >> $HOME/.xprofile

sudo pacman -S firefox

sudo pacman -Sy --noconfirm git base-devel
sudo git clone https://aur.archlinux.org/google-chrome.git
sudo cd google-chrome
sudo makepkg -s --noconfirm
sudo pacman -U --noconfirm google-chrome-*.pkg.tar.xz
sudo pacman -Sy --noconfirm ttf-sazanami

sudo echo "---------"
sudo echo "finished."
sudo echo "---------"

set +x
