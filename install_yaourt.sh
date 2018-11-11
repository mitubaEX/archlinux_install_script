#!/bin/bash

# other tools
sudo pacman -S --needed base-devel git wget yajl
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si
cd ..

# yarout
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si
cd ..

# remove
sudo rm -dR yaourt/ package-query/
