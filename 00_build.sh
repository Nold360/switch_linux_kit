#!/bin/bash
set -x
set -e
set -u

cd shofel2/exploit
make -j2

cd /source
cd u-boot
export CROSS_COMPILE=aarch64-linux-gnu-
make nintendo-switch_defconfig
make -j2

cd /source
cd librecore-utils
mkdir build || true
cd build
cmake ..
make
make install #needed?!
#./build/util/cbfstool/cbfstool bootloader-dragon-google_smaug.7900.97.0.img extract -n fallback/tegra_mtc -f tegra_mtc.bin

cd /source
cd coreboot
make nintendo_switch_defconfig
make iasl
make

cd /source
cd imx_usb_loader
# why?
# git reset --hard 0a322b01cacf03e3be727e3e4c3d46d69f2e343e
make -j2

cd /source
cd linux
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu- #useless
make nintendo-switch_defconfig
make -j2
