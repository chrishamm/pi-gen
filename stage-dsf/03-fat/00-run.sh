#!/bin/bash -e

# Create default RRF directories
mkdir "${ROOTFS_DIR}/boot/filaments"
mkdir "${ROOTFS_DIR}/boot/gcodes"
mkdir "${ROOTFS_DIR}/boot/macros"
mkdir "${ROOTFS_DIR}/boot/menu"
mkdir "${ROOTFS_DIR}/boot/sys"
mkdir "${ROOTFS_DIR}/boot/www"

# Install config.g
install files/config.g "${ROOTFS_DIR}/boot/sys/config.g"

# Obtain and install the latest RepRapFirmware files for Duet 3
RRF_ASSETS_URL=`curl "https://api.github.com/repos/Duet3D/RepRapFirmware/releases" | jq 'map(select( .prerelease == false )) | .[0].assets_url' -r`
RRF_PKG_URL=`curl "$RRF_ASSETS_URL" | jq '.[] | select(.browser_download_url | test("Duet2and3Firmware.*\\\\.zip$")) | .browser_download_url' -r`
curl -L "$RRF_PKG_URL" | bsdtar -xf - --include "Duet3*" -C "${ROOTFS_DIR}/boot/sys"

# Obtain and install the latest DWC SD package
DWC_ASSETS_URL=`curl "https://api.github.com/repos/Duet3D/DuetWebControl/releases" | jq 'map(select( .prerelease == false )) | .[0].assets_url' -r`
DWC_SD_PKG_URL=`curl "$DWC_ASSETS_URL" | jq '.[] | select(.browser_download_url | test("SD\\\\.zip$")) | .browser_download_url' -r`
curl -L "$DWC_SD_PKG_URL" | bsdtar -xf - -C "${ROOTFS_DIR}/boot/www"

