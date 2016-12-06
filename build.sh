#!/bin/bash
rm .version
make mrproper
make clean
# Kernel Details
VER=".R13"
BASE_AK_VER="Sharkey"

# Vars
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=mdalexca
export KBUILD_BUILD_HOST=DarkRoom

#paths
KERNEL_DIR="${HOME}/android/marlin"
ZIP_MOVE="${HOME}/android/AK-releases"
ZIMAGE_DIR="${HOME}/android/marlin/arch/arm64/boot/"
MODULES_DIR="${HOME}/android/lazyflasher/modules"

#build info 
THREAD="-j$(grep -c ^processor /proc/cpuinfo)"
export CROSS_COMPILE=${HOME}/android/uberbuild/out/aarch64-linux-android-6.x/bin/aarch64-linux-android-
TC="UBER6.x"
AK_VER="$BASE_AK_VER$VER$TC"
export LOCALVERSION=~`echo $AK_VER`
export LOCALVERSION=~`echo $AK_VER`
DEFCONFIG="sharkey_defconfig"
make $DEFCONFIG
make $THREAD

#make our zips
cp -vr $ZIMAGE_DIR/Image.gz-dtb ~/android/lazyflasher/zImage
cd ~/android/lazyflasher
make VERSION=$VER
cd $KERNEL_DIR
