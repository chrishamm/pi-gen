#!/bin/bash

# Replace package list
install -m 644 files/duet3d.list "${ROOTFS_DIR}/etc/apt/sources.list.d/duet3d.list"

# Upgrade to unstable package lists and remove the unstable package list again
on_chroot << EOF
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -o Dpkg::Options::="--force-confold"
EOF
