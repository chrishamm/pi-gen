#!/bin/bash

# Hopefully this is temporary; Debian still ships outdated bossa versions
install -m755 files/bossa "${ROOTFS_DIR}/usr/bin/bossa"
install -m755 files/bossash "${ROOTFS_DIR}/usr/bin/bossash"

