#!/bin/bash

# Secure VPS wipe and shutdown script
# WARNING: This will destroy all data and shut down the server

echo "Starting secure wipe..."

# Automatically detect the root disk (ignores loop and RAM disks)
DISK=$(lsblk -ndo NAME,TYPE | grep 'disk' | awk '{print $1}' | head -n 1)
DISK="/dev/$DISK"

echo "Detected disk: $DISK"
read -p "WARNING: This will destroy ALL data on $DISK. Proceed? (yes/no): " confirm

if [[ "$confirm" != "yes" ]]; then
    echo "Aborted."
    exit 1
fi

# Overwrite disk with random data (slow but secure)
echo "Wiping $DISK with random data..."
dd if=/dev/urandom of="$DISK" bs=1M status=progress

echo "Wipe complete. Shutting down..."
shutdown -h now
