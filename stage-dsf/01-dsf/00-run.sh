#!/bin/bash -e

install -m 644 files/duet3d.gpg "${ROOTFS_DIR}/etc/apt/trusted.gpg.d/duet3d.gpg"
install -m 644 files/duet3d.gpg "${ROOTFS_DIR}/usr/share/keyrings/duet3d.gpg"
install -m 644 files/duet3d.list "${ROOTFS_DIR}/etc/apt/sources.list.d/duet3d.list"

install -m 755 files/set-dsf-chipdev "${ROOTFS_DIR}/usr/bin/set-dsf-chipdev"
install -m 644 files/set-dsf-chipdev.service "${ROOTFS_DIR}/usr/lib/systemd/system/set-dsf-chipdev.service"

on_chroot << EOF
systemctl daemon-reload
systemctl enable set-dsf-chipdev.service

apt-get update
EOF
