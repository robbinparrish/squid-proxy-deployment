#!/bin/bash

# Path where the Squid deployment is configured.
# NEED TO REPLACE THEASE TO CORRECT PATH.
SQUID_DEPLOYMENT_DIR="${HOME}/squid-proxy-deployment"
SQUID_DEPLOYMENT_BACKUP_PATH="${HOME}/squid-proxy-deployment-backup"

# Backup directory.
BACKUP_TIME=$(date "+%d%m%Y%H%M%S")
SQUID_DEPLOYMENT_BACKUP_DIR="${SQUID_DEPLOYMENT_BACKUP_PATH}/${BACKUP_TIME}"

cd "${SQUID_DEPLOYMENT_DIR}" || exit 1

# Backup configuration files.
mkdir -p "${SQUID_DEPLOYMENT_BACKUP_DIR}"
cp -av ./squid-data/cache-dir ./configs/squid.conf ./configs/squid.conf.d "${SQUID_DEPLOYMENT_BACKUP_DIR}"/
sync
 
# Compress the backup.
cd "${SQUID_DEPLOYMENT_BACKUP_PATH}" || exit 1
tar -cvzf "${BACKUP_TIME}".tar.gz "${BACKUP_TIME}"
rm -rf "${BACKUP_TIME}"
sync
