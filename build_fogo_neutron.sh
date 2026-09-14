#!/bin/bash
set -e

CLANG_PATH="$HOME/toolchains/neutron-clang"

export PATH="$CLANG_PATH/bin:$PATH"

BUILD_OPTIONS=(
    -j"$(nproc --all)"
    ARCH=arm64
    LLVM=1
    LLVM_IAS=1
    HOSTCC=gcc
    HOSTCXX=g++
    AR=llvm-ar
    NM=llvm-nm
    OBJCOPY=llvm-objcopy
    OBJDUMP=llvm-objdump
    STRIP=llvm-strip
    O="out"
)

make "${BUILD_OPTIONS[@]}" gki_defconfig vendor/holi_GKI.config vendor/ext_config/moto-holi-fogo.config
make "${BUILD_OPTIONS[@]}"
