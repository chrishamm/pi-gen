#!/bin/bash

install -m 644 files/config.g -o 996 -g 996 "${ROOTFS_DIR}/opt/dsf/sd/sys/config.g"

on_chroot << EOF
systemctl enable duetcontrolserver
systemctl enable duetwebserver

gpasswd -a pi dsf
EOF
