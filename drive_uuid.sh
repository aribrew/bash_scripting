#!/bin/bash

if [[ "$1" == "" ]];
then
    echo -e "Need a drive label to find.\n"
    exit 1
fi


DRIVE_LABEL="$1"

UUID=$(sudo blkid | grep " LABEL=\"${DRIVE_LABEL}\"")
UUID=$(echo "$UUID" | grep -oP ' UUID="[^"]+"' | xargs)


if [[ "$UUID" == "" ]];
then
    echo -e "No drive with label '$DRIVE_LABEL' was found\n".
    exit 1
fi


echo -e "$UUID"
