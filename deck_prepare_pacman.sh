#!/bin/bash

echo -e "This script will prepare Steam Deck's pacman for installing packages."
echo -e ""
echo -e "In the Steam Deck, the OS is initially read-only. You cannot install"
echo -e "anything with pacman (ArchLinux, and so SteamOS, package manager)."
echo -e "In order to be able to do so, disabling the read-only flag is needed."
echo -e "Also, some setup need to be done for pacman to work."
echo -e ""

echo -e "BEFORE run this script, test if you can do 'sudo pacman update'"
echo -e "without errors, to avoid break things."
echo -e ""
echo -e "You maybe also need setting the deck user password with 'passwd' if"
echo -e "no yet done."
echo -e ""


read -p "Proceed? (Y/n): " proceed

if ! [[ "$proceed" == "Y" ]];
then
    echo -e "Aborted.\n"
    exit 1
fi


if ! [[ "$USER" == "deck" ]];
then
    echo -e "Huh? This is not a Steam Deck!\n"
    exit 1
fi


echo -e "Disabling SteamOS read-only protection ...\n"

sudo steamos-readonly disable

if ! [[ "$?" == "0" ]];
then
    echo -e "Failed!\n"
    exit 1
fi


echo -e "Preparing pacman ...\n"

sudo pacman-key --init

if ! [[ "$?" == "0" ]];
then
    echo -e "Pacman-key failed initializing.\n"
    exit 1
fi


sudo pacman-key --populate archlinux

if ! [[ "$?" == "0" ]];
then
    echo -e "Failed populating archlinux pacman-key.\n"
    exit 1
fi


sudo pacman-key --populate holo

if ! [[ "$?" == "0" ]];
then
    echo -e "Failed populating holo pacman-key.\n"
    exit 1
fi


echo -e "Done!\n"
