#!/bin/bash
# This script prepares the dune-archiso live environment
# for installation.
pacman-key --init
pacman-key --populate archlinux
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime

# https://superuser.com/a/758464/912402
# xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
# xrandr --addmode Virtual1 1920x1080
# xrandr --output Virtual1 --mode 1920x1080
# xrandr --output VGA1 --mode 1920x1080 --rate 60 --brightness 0.1 --output HDMI1 --mode 1920x1080 --rate 60 --brightness 0.1
# xrandr --output VGA1 --mode 1920x1080 --rate 60 --brightness 0.1 --output HDMI1 --mode 1920x1080 --rate 60 --brightness 0.1
# Nice help https://bbs.archlinux.org/viewtopic.php?id=243875
# https://wiki.archlinux.org/index.php/desktop_entries#Hide_desktop_entries

# https://www.linux.com/topic/desktop/cleaning-your-linux-startup-process/

# Force remove package with pacman https://unix.stackexchange.com/a/10179/292992

# pacman -Rdd avahi --noconfirm
echo 'NoDisplay=true' >>/usr/share/applications/bssh.desktop
echo 'NoDisplay=true' >>/usr/share/applications/bvnc.desktop
# rm /usr/share/applications/avahi-discover.desktop

# pacman -Rdd v4l-utils --noconfirm
echo 'NoDisplay=true' >>/usr/share/applications/qv4l2.desktop
echo 'NoDisplay=true' >>/usr/share/applications/qvidcap.desktop
# rm /usr/share/applications/qv4l2.desktop
# rm /usr/share/applications/qvidcap.desktop

# pacman -Rdd qt5-tools --noconfirm
echo 'NoDisplay=true' >>/usr/share/applications/assistant.desktop
echo 'NoDisplay=true' >>/usr/share/applications/designer.desktop
echo 'NoDisplay=true' >>/usr/share/applications/linguist.desktop
echo 'NoDisplay=true' >>/usr/share/applications/qdbusviewer.desktop
# rm /usr/share/applications/assistant.desktop
# rm /usr/share/applications/designer.desktop
# rm /usr/share/applications/linguist.desktop
# rm /usr/share/applications/qdbusviewer.desktop

echo 'NoDisplay=true' >>/usr/share/applications/nm-connection-editor.desktop
# rm /usr/share/applications/nm-connection-editor.desktop

pacman -Rdd gnome-disk-utility --noconfirm
#systemctl disable bluetooth.service
#systemctl mask bluetooth.service
systemctl disable accounts-daemon.service

sudo -H -u duneuser bash -c 'echo [url \"ssh://aur@aur.archlinux.org/\"] >>~/.gitconfig'
sudo -H -u duneuser bash -c "echo '    insteadOf = \"aur:\"' >>~/.gitconfig"

#https://askubuntu.com/a/294748/791670
sudo -H -u duneuser bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo -H -u duneuser bash -c "git clone --filter=blob:none --depth=1 https://github.com/hlissner/doom-emacs.git ~/.emacs.d"
sudo -H -u duneuser bash -c "echo 'export PATH=\$HOME/.emacs.d/bin:\$PATH' >>~/.zshrc"
sudo -H -u duneuser bash -c "echo 'xrandr -s 1920x1080' >>~/.zshrc"
sudo -H -u duneuser bash -c "mkdir -p ~/.packages && cd ~/.packages && curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/yay-bin.tar.gz && tar -xvf yay-bin.tar.gz && cd yay-bin && makepkg && mv *.zst .. && cd .. && rm -rf yay-bin && sudo repo-add ./custom.db.tar.gz ./*"

sed -i 's/^#\[custom\]/\[custom\]/' /etc/pacman.conf
sed -i 's/^#SigLevel = Optional TrustAll/SigLevel = Optional TrustAll/' /etc/pacman.conf
sed -i 's/^#Server = file:\/\/\/home\/custompkgs/Server = file:\/\/\/home\/duneuser\/.packages/' /etc/pacman.conf
#sed -i 's/custompkgs/duneuser\/.packages/g' /etc/pacman.conf

pacman -Sy yay-bin --noconfirm
#git clone aur:mypackage
