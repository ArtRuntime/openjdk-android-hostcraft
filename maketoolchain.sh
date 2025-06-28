#!/bin/bash
set -e

. setdevkitpath.sh

if [[ ! -f $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain/devkit.info.${TARGET_SHORT} ]]; then
  $NDK/build/tools/make-standalone-toolchain.sh \
	  --arch=${TARGET_SHORT} \
	  --platform=android-21 \
	  --install-dir=$NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain
cp devkit.info.${TARGET_SHORT} $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain/
else
  echo "NDK already has android-${TARGET_SHORT}-toolchain."
fi