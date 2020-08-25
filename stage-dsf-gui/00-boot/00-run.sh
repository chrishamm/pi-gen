#!/bin/bash

# Remove wpa_supplicant.conf, in the GUI there is now piwiz
rm "${ROOTFS_DIR}/boot/wpa_supplicant.conf"

# Turn off SSH
on_chroot << EOF
systemctl disable ssh
EOF
