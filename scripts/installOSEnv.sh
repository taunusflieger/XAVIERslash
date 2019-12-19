##!/bin/bash
# scripts needs to run as sudo

# Mount SSD with user home and data
mkdir -p /mnt/home
grep -qF 'UUID=607d7acf-b6c8-4aff-a2a2-f6c2f7529187' /etc/fstab || echo 'UUID=607d7acf-b6c8-4aff-a2a2-f6c2f7529187       /mnt/home             ext4           defaults                                     00 ' >> /etc/fstab
mount -a
