#!/bin/bash

install -m644 files/spidev.conf "${ROOTFS_DIR}/etc/modprobe.d/spidev.conf"
install -m644 files/minirc.dfl "${ROOTFS_DIR}/etc/minicom/minirc.dfl"
install files/wpa_supplicant.conf "${ROOTFS_DIR}/boot/wpa_supplicant.conf"

on_chroot << EOF
chown pi:root /etc/hostname
chown pi:root /etc/hosts
EOF
