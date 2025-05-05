#!/usr/bin/env bash
. bin/env.sh
bin/apply_patch.sh
./build.sh --model 5 --debug 0 --edk2-flags "${EDK2_BUILD_FLAGS}"
