#!/bin/bash

cd shofel2/usb_loader
../../u-boot/tools/mkimage -A arm64 -T script -C none -n "boot.scr" -d switch.scr switch.scr.img
sudo ../../imx_usb_loader/imx_usb -c . # This command needs root or permissions to access usb devices

cd -
