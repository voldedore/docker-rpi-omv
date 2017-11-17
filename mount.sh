#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo_mess()
{
  COLOR=$GREEN
  TYPE="OK"
  if [ "$2" = "1" ]
  then
    COLOR=$RED
    TYPE="ERR"
  fi

  echo -e "[ ${COLOR}$TYPE${NC} ] $1"
}

# Check some required info
if [ -f "data/STORAGE_LABEL" ]
then
  LABEL=`cat data/STORAGE_LABEL`
  echo_mess "STORAGE_LABEL known as $LABEL"
else
  echo_mess "No STORAGE_LABEL found. Please input STORAGE_LABEL file in /data directory. Exiting..." 1
  exit 1
fi

if [ -f "data/STORAGE_TYPE" ]
then
  TYPE=`cat data/STORAGE_TYPE`
  echo_mess "STORAGE_TYPE known as $TYPE"
else
  echo_mess "No STORAGE_TYPE found. Please input STORAGE_TYPE file in /data directory. Exiting..." 1
  exit 1
fi

if [ -z "$LABEL" ]
then
  exit 1
fi

# Check if device is already mounted
files=(/mnt/storage/$LABEL/*)
if [ ${#files[@]} -gt 0 ]; then exit 2; fi

#echo "LABEL=$LABEL /mnt/storage/$LABEL $TYPE rw,relatime,discard,data=ordered 0 2" >> /etc/fstab
echo "/dev/disk/by-label/$LABEL /srv/dev-disk-by-label-$LABEL $TYPE defaults,nofail 0 2" > /etc/fstab
mkdir -p /mnt/storage/$LABEL
mount -L $LABEL /mnt/storage/$LABEL
