#!/usr/bin/env bash
. bin/env.sh
./build.sh --model 5 --debug 0 --edk2-flags "${EDK2_BUILD_FLAGS}"
