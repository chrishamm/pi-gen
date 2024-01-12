#!/bin/bash

# Install preset files for in-house testing
cp -r files/macros/* "${ROOTFS_DIR}/boot/firmware/macros/"
cp -r files/sys/* "${ROOTFS_DIR}/boot/firmware/sys/"

