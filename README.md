# archlinux_install_script

## install procedure

```
# install core
wget https://raw.githubusercontent.com/mitubaEX/archlinux_install_script/master/setup.sh
sh setup.sh

reboot

# please login your root password

# install package
wget https://raw.githubusercontent.com/mitubaEX/archlinux_install_script/master/setup.sh
sh setup.sh

reboot

# please login your root user and your create other user
useradd -m <username>
passwd <username>

pacman -S sudo
visudo # Please add `<username> ALL=(All) ALL` below `root ALL=(ALL) ALL` line

reboot

# login your other user and enjoy!
```
