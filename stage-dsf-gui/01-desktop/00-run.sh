#!/bin/bash -e

install -m 755 files/launch-dwc "${ROOTFS_DIR}/usr/bin/launch-dwc"
install -m 644 files/duet3d.png "${ROOTFS_DIR}/usr/share/wallpapers/duet3d.png"
install -m 644 files/dwc.png "${ROOTFS_DIR}/usr/share/icons/dwc.png"

install -m 755 -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/pi/Desktop"
install -m 755 -o 1000 -g 1000 files/launch-dwc.desktop "${ROOTFS_DIR}/home/pi/Desktop/launch-dwc.desktop"
install -m 755 -o 1000 -g 1000 files/view-dcs-log.desktop "${ROOTFS_DIR}/home/pi/Desktop/view-dcs-log.desktop"
install -m 644 -o 1000 -g 1000 files/xscreensaver "${ROOTFS_DIR}/home/pi/.xscreensaver"

on_chroot << EOF
systemctl disable bluetooth hciuart cups cups-browsed
apt-get purge -y pulseaudio system-config-printer
apt-get autoremove -y

update-alternatives --install /usr/share/desktop-base/duet3d.png desktop-background /usr/share/wallpapers/duet3d.png 80
update-alternatives --set desktop-background /usr/share/wallpapers/duet3d.png
EOF
