#!/bin/bash

install files/wpa_supplicant.conf "${ROOTFS_DIR}/boot/wpa_supplicant.conf"

on_chroot << EOF
systemctl disable hciuart.service
systemctl disable bluealsa.service
systemctl disable bluetooth.service

chown pi:root /etc/hostname
chown pi:root /etc/hosts
EOF
