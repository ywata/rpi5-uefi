#!/usr/bin/env bash

# Declare an associative array with file paths as keys and patch file names as values
declare -A patches=(
  ["edk2/CryptoPkg/Library/OpensslLib/OpensslLib.inf"]="patch/OpensslLib.inf.patch"
)

# Iterate over the array and apply each patch
for file in "${!patches[@]}"; do
  patch_file="${patches[$file]}"
  echo "Applying patch $patch_file to $file"
  patch "$file" "$patch_file"
done
