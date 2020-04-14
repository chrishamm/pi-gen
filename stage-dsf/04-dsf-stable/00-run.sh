#!/bin/bash -e

rm "${ROOTFS_DIR}/etc/apt/sources.list.d/duet3d.list"
install -m 644 files/duet3d.list "${ROOTFS_DIR}/etc/apt/sources.list.d/duet3d.list"
