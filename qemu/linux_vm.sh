#!/bin/bash

export QVM_ARCH="x86_64"
export QVM_CPU_SMP="6"
export QVM_CPU_CORES="6"
export QVM_RAM="6G"
export QVM_EFI="EFI/OVMF_CODE.fd"
export QVM_EFI_VARS="EFI/OVMF_VARS.fd"
export QVM_DISPLAY="sdl,gl=on"
export QVM_VIDEO_DEVICE="virtio-vga-gl"
export QVM_AUDIO_DEVICE="intel-hda"
export QVM_NETWORK_CARD="virtio-net-pci"
export QVM_INCLUDE_USB="1"
export QVM_INCLUDE_NETWORK="1"
export QVM_FORWARDED_PORTS="hostfwd=tcp::6022-:22"
export QVM_EXTRA_DEVICES="-device usb-kbd -device usb-tablet"

#export QVM_HDA="harddrives/Debian_12.qcow2"
#export QVM_CDROM="iso/debian-12.9.0-amd64-netinst.iso"

export QVM_BOOT_ORDER="c"

echo -e "Config for Linux QVM loaded.\b"
echo -e "Export (or add) the HD and ISO file paths, if any, in the"
echo -e "QVM_HDA and QVM_CDROM variables.\n"

