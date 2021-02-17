#!/bin/bash
# This script prepares the dune-archiso live environment
# for installation.
pacman-key --init
pacman-key --populate archlinux
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime

xrandr --output VGA1 --mode 1920x1080 --rate 60 --brightness 0.1 --output HDMI1 --mode 1920x1080 --rate 60 --brightness 0.1

pacman -Rdd avahi qt5-tools v4l-utils
#systemctl disable bluetooth.service
#systemctl mask bluetooth.service
systemctl disable accounts-daemon.service
#mkdir /home/duneuser/dunerepo
#repo-add 
#git clone --filter=blob:none --depth=1 https://github.com/hlissner/doom-emacs.git /home/duneuser/emacs.d

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
