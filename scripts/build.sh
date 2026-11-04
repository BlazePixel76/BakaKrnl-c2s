#!/bin/bash
set -e
cd ~/kernel-build/kernel
export LOCALVERSION=
export PATH=$HOME/kernel-build/clang/bin:$PATH ARCH=arm64
make O=out CC=clang HOSTCC=clang LLVM=1 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc) 2>&1 | tee build.log
cat out/include/config/kernel.release
