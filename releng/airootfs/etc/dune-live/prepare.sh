#!/bin/bash
# This script prepares the dune-archiso live environment
# for installation.

sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
sed -i 's/#\(es_PE\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime

pacman-key --init
# Omame - cyberos
# pacman-key --recv-keys BE381BCAC6A66564D937B699B63C67A37C97B2D8
# pacman-key --finger BE381BCAC6A66564D937B699B63C67A37C97B2D8
# pacman-key --lsign-key BE381BCAC6A66564D937B699B63C67A37C97B2D8
curl https://raw.githubusercontent.com/cyberos/cyberos-keyring/main/cyberos.gpg | gpg --import
# Arch4edu
pacman-key --recv-keys 7931B6D628C8D3BA
pacman-key --finger 7931B6D628C8D3BA
pacman-key --lsign-key 7931B6D628C8D3BA
pacman-key --refresh-keys
# Oromion - dune-archiso-repos
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 5BC6FBBAB02C73E4724B2CFC8C43C00BA8F06ECA
# Dune - Christoph Grüninger
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 2AA99AA4E2D6214E6EA01C9A4AF42916F6E5B1CF
pacman-key --populate archlinux
pacman-key --populate cyberos
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
# echo 'NoDisplay=true' >>/usr/share/applications/bssh.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/bvnc.desktop
rm /usr/share/applications/avahi-discover.desktop
rm /usr/share/applications/bssh.desktop
rm /usr/share/applications/bvnc.desktop

# pacman -Rdd v4l-utils --noconfirm
# echo 'NoDisplay=true' >>/usr/share/applications/qv4l2.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/qvidcap.desktop
rm /usr/share/applications/qv4l2.desktop
rm /usr/share/applications/qvidcap.desktop
# pacman -Rdd qt5-tools --noconfirm
# echo 'NoDisplay=true' >>/usr/share/applications/assistant.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/designer.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/linguist.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/qdbusviewer.desktop
rm /usr/share/applications/assistant.desktop
rm /usr/share/applications/designer.desktop
rm /usr/share/applications/linguist.desktop
rm /usr/share/applications/qdbusviewer.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/lstopo.desktop
rm /usr/share/applications/lstopo.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/nm-connection-editor.desktop
rm /usr/share/applications/nm-connection-editor.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/electron.desktop
rm /usr/share/applications/electron.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/emacsclient.desktop
rm /usr/share/applications/emacsclient.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/fluid.desktop
rm /usr/share/applications/fluid.desktop
# echo 'NoDisplay=true' >>/usr/share/applications/vim.desktop
rm /usr/share/applications/vim.desktop

pacman -Rdd gnome-disk-utility --noconfirm
#systemctl disable bluetooth.service
#systemctl mask bluetooth.service
systemctl disable accounts-daemon.service
# git clone aur:mypackage
#https://askubuntu.com/a/294748/791670

mount -o remount,size=8G /run/archiso/cowspace

# sudo -H -u duneuser bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# sudo -H -u duneuser bash -c "echo 'export PATH=\$HOME/.emacs.d/bin:\$PATH' >>~/.zshrc"
sudo -H -u duneuser bash -c "cd ~ && { curl -Ok https://www.math.tu-dresden.de/\~osander/research/sander-getting-started-with-dune-2.7.pdf ; cd -; }"
sudo -H -u duneuser bash -c "cd ~ && { curl -O https://conan.iwr.uni-heidelberg.de/data/teaching/oopfsc_ws2020/slides.pdf ; cd -; }"
sudo -H -u duneuser bash -c "cd ~ && { curl -O https://arxiv.org/pdf/1807.05252.pdf ; cd -; }"
sudo -H -u duneuser bash -c "git clone --filter=blob:none --depth=1 https://gitlab.dune-project.org/dune-course/iwr-course-2021.git ~/iwr-course-2021"
sudo -H -u duneuser bash -c "chmod -R +x ~/.emacs.d/bin && ~/.emacs.d/bin/doom -y install"

# sed -i 's/^#\[custom\]/\[custom\]/' /etc/pacman.conf
# sed -i 's/^#SigLevel = Optional TrustAll/SigLevel = Optional TrustAll/' /etc/pacman.conf
# sed -i 's/^#Server = file:\/\/\/home\/custompkgs/Server = file:\/\/\/home\/duneuser\/.packages/' /etc/pacman.conf

# sudo -H -u duneuser bash -c "cd ~/.packages && cd emacs-native-comp-git && makepkg && find . -type f ! -name '*.tar.zst' -delete && mv *tar.zst .. && cd .. && rm -rf emacs-native-comp-git"
