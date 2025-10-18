#!/bin/bash

if [[ "$1" == "" ]];
then
    echo -e "Need a drive label to find.\n"
    exit 1
fi


DRIVE_LABEL="$1"

DRIVE_TYPE=$(sudo blkid | grep " LABEL=\"${DRIVE_LABEL}\"")
DRIVE_TYPE=$(echo "$DRIVE_TYPE" | grep -oP 'TYPE="[a-z]+[0-9]?"' | xargs)


if [[ "$DRIVE_TYPE" == "" ]];
then
    echo -e "No drive with label '$DRIVE_LABEL' was found\n".
    exit 1
fi


DRIVE_TYPE=$(echo "$DRIVE_TYPE" | cut -d '=' -f 2)

echo -e "$DRIVE_TYPE"
