#!/bin/bash

if [[ "$1" == "" ]];
then
    echo -e "Need a device or UUID to find.\n"
    exit 1
fi


DRIVE="$1"


if [[ $DRIVE == /dev/* ]];
then
    DRIVE_LABEL=$(sudo blkid | grep "$DRIVE")

elif [[ $DRIVE == UUID* ]];
then
    DRIVE_UUID=$(echo "$DRIVE" | cut -d '=' -f 2)
    DRIVE="UUID=\"$DRIVE_UUID\""
    DRIVE_LABEL=$(sudo blkid | grep $DRIVE)
fi


if [[ "$DRIVE_LABEL" == "" ]];
then
    echo -e "No drive '$DRIVE' was found.\n"
    exit 1
fi


DRIVE_LABEL=$(echo "$DRIVE_LABEL" | grep -oP ' LABEL="([^"]+)"')
DRIVE_LABEL=$(echo "$DRIVE_LABEL" | xargs | cut -d '=' -f 2)


echo -e "$DRIVE_LABEL"

