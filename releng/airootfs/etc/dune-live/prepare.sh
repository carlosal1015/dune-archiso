#!/bin/bash
# This script prepares the dune-archiso live environment
# for installation.
pacman-key --init
pacman-key --populate archlinux
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime

xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual1 1920x1080
xrandr --output Virtual1 --mode 1920x1080
#xrandr --output VGA1 --mode 1920x1080 --rate 60 --brightness 0.1 --output HDMI1 --mode 1920x1080 --rate 60 --brightness 0.1
#xrandr --output VGA1 --mode 1920x1080 --rate 60 --brightness 0.1 --output HDMI1 --mode 1920x1080 --rate 60 --brightness 0.1
# Nice help https://bbs.archlinux.org/viewtopic.php?id=243875
# https://wiki.archlinux.org/index.php/desktop_entries#Hide_desktop_entries
pacman -Rdd avahi --noconfirm
# echo "NoDisplay=true" >> /usr/share/applications/avahi-discover.desktop
# echo "NoDisplay=true" >> /usr/share/applications/bssh.desktop
# echo "NoDisplay=true" >> /usr/share/applications/bvnc.desktop

pacman -Rdd v4l-utils --noconfirm
# echo "NoDisplay=true" >> /usr/share/applications/qv4l2.desktop
# echo "NoDisplay=true" >> /usr/share/applications/qvidcap.desktop

pacman -Rdd qt5-tools --noconfirm
# echo "NoDisplay=true" >> /usr/share/applications/assistant.desktop
# echo "NoDisplay=true" >> /usr/share/applications/designer.desktop
# echo "NoDisplay=true" >> /usr/share/applications/linguist.desktop
# echo "NoDisplay=true" >> /usr/share/applications/qdbusviewer.desktop

#systemctl disable bluetooth.service
#systemctl mask bluetooth.service
systemctl disable accounts-daemon.service
#mkdir /home/duneuser/dunerepo
#repo-add 
#git clone --filter=blob:none --depth=1 https://github.com/hlissner/doom-emacs.git /home/duneuser/emacs.d

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
