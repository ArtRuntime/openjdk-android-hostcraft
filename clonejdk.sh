#!/bin/bash
set -e
if [[ "$TARGET_JDK" == "arm" ]]; then
git clone --depth 1 https://github.com/openjdk/aarch32-port-jdk8u openjdk  || true
elif [[ "$BUILD_IOS" == "1" ]]; then
git clone --depth 1 https://github.com/corretto/corretto-8 --branch 8.472.08.1 openjdk  || true
elif [[ "$TARGET_JDK" == "aarch64" ]]; then
  # See https://github.com/openjdk/jdk8u/commit/ffdc8d8946c307a2ce911b2e6f6fa654c71d81b6 as to how they broke newer versions for aarch64.
git clone --depth 1 https://github.com/openjdk/jdk8u --branch jdk8u482-ga openjdk || true
else
# Use aarch32 repo because it also has aarch64
git clone --depth 1 https://github.com/openjdk/jdk8u openjdk  || true
fi
