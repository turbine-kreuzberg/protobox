#!/bin/sh

MNT_DIR="/mnt/mybook_media"

[ -d  "$MNT_DIR" ] || mkdir "$MNT_DIR"

CHECK=$( grep "$MNT_DIR" /etc/fstab )

if [ -z "$CHECK" ]; then

    NEW_MOUNT="192.168.1.220:/volume1/mybook/shop/media $MNT_DIR nfs rw,nfsvers=3 0 0"

    echo "$NEW_MOUNT" >> /etc/fstab

    mount -a

    ln -s "$MNT_DIR" /var/www/mybook_shop/media
fi