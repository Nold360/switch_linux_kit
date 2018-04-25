### Switch Linux Kit
Build Linux for Nintendo Switch from Sourcecode using [Docker Toolchain](https://hub.docker.com/r/nold360/switch_linux_toolchain/)

### Cloning
```
git clone https://github.com/Nold360/switch_linux_kit
cd switch_linux_kit
git submodule update --init
```

### Compiling
***Note:*** You'll still need to get `coreboot/tegra_mtc.bin` on your own.

```
docker run -ti --rm -v$(pwd):/source nold360/switch_linux_toolchain bash 00_build.sh
```

### Profit!
***Note:*** You still need to prepare a rootfs SD-Card like described [here](https://github.com/fail0verflow/shofel2)

Then simply run the exploit & uboot-scripts:
```
bash -x 02_exploit.sh
bash -x 03_uboot.sh

```
