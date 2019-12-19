#!/bin/bash
NUM_CPU=$(nproc)
TEGRA_KERNEL_OUT=~/Xavier-Kernel
LINUX_SRC=/usr/src/linux
CROSS_COMPILE=/usr/local/gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu/bin/aarch64-linux-gnu-
LOCALVERSION=-tegra

sudo ./flash.sh -r -k kernel jetson-xavier mmcblk0p1