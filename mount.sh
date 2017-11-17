#!/bin/bash

# Check some required info
if [ -f "/data/STORAGE_LABEL" ]
then
  LABEL=`cat /data/STORAGE_LABEL`
else
  return 1
fi

if [ -f "/data/STORAGE_TYPE" ]
then
  TYPE=`cat /data/STORAGE_TYPE`
else
  return 1
fi

if [ -z "$LABEL" ] then
  return 1
fi

# Check if device is already mounted
files=(/mnt/storage/$LABEL/*)
if [ ${#files[@]} -gt 0 ]; then return 2; fi

echo "LABEL=$LABEL /mnt/storage/$LABEL $TYPE rw,relatime,discard,data=ordered 0 2" >> /etc/fstab
mkdir -p /mnt/storage/$LABEL
mount -L $LABEL /mnt/storage/$LABEL
