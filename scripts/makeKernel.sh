#!/bin/bash
NUM_CPU=$(nproc)
TEGRA_KERNEL_OUT=~/Xavier-Kernel
LINUX_SRC=/usr/src/linux
CROSS_COMPILE=/usr/local/gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu/bin/aarch64-linux-gnu-
LOCALVERSION=-tegra

mkdir -p $TEGRA_KERNEL_OUT

cp $LINUX_SRC/LT4-32.2.3.config $TEGRA_KERNEL_OUT/.config 
make mrproper
time make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE -j$(($NUM_CPU - 1)) O=$TEGRA_KERNEL_OUT 
