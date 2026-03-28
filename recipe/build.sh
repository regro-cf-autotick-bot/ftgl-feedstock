#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

cmake -B build -S ${SRC_DIR} -G Ninja \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -G Ninja -DCMAKE_BUILD_TYPE=Release ${CMAKE_ARGS} 

cmake --build build -j ${CPU_COUNT}
cmake --install build
