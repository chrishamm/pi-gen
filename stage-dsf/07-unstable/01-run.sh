#!/bin/bash

install -m 644 files/plugins.txt -o 992 -g 992 "${ROOTFS_DIR}/opt/dsf/conf/plugins.txt"

on_chroot << EOF
chown dsf:dsf /opt/dsf/sd/sys/config.g
chown dsf:dsf /opt/dsf/conf/plugins.txt
EOF
