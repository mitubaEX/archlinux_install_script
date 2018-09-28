# archlinux_install_script

## install procedure

```sh
# install core
wget https://raw.githubusercontent.com/mitubaEX/archlinux_install_script/master/setup.sh
sh setup.sh

reboot

# Please login your root password

# install package
wget https://raw.githubusercontent.com/mitubaEX/archlinux_install_script/master/setup.sh
sh setup.sh

reboot

# Please login your root user and your create other user.
useradd -m <username>
passwd <username>

# user configuration
pacman -S sudo
visudo # Please add `<username> ALL=(All) ALL` below `root ALL=(ALL) ALL` line

# network configuration
wifi-menu -o # Please select use network
cd /etc/netctl
netctl enable <your network profile>

reboot

# Login your other user and enjoy!
```
