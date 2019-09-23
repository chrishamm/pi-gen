#!/bin/bash -e

install -m 644 files/duet3d.png "${ROOTFS_DIR}/usr/share/wallpapers/duet3d.png"

on_chroot << EOF
update-alternatives --install /usr/share/desktop-base/duet3d.png desktop-background /usr/share/wallpapers/duet3d.png 80
update-alternatives --set desktop-background /usr/share/wallpapers/duet3d.png
EOF
