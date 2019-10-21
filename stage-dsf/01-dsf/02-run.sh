#!/bin/bash

install -m 644 files/config.g "${ROOTFS_DIR}/opt/dsf/sd/sys/config.g"

on_chroot << EOF
systemctl enable duetcontrolserver
systemctl enable duetwebserver
EOF
