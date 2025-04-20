#!/usr/bin/env bash

export EDK2_SECUREBOOT_FLAGS=""
if [ -d keys ]; then
  export EDK2_SECUREBOOT_FLAGS=" \
               -D DEFAULT_KEYS=TRUE \
               -D PK_DEFAULT_FILE=keys/pk.cer \
               -D KEK_DEFAULT_FILE1=keys/ms_kek.cer \
               -D DB_DEFAULT_FILE1=keys/ms_db1.cer \
               -D DB_DEFAULT_FILE2=keys/ms_db2.cer \
               -D DBX_DEFAULT_FILE1=keys/arm64_dbx.bin \
               -D SECURE_BOOT_ENABLE=TRUE"
fi
OWNER=ywata
	  export EDK2_BUILD_FLAGS=" \
              --pcd gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVendor=L"${OWNER}}" \
              ${EDK2_SECUREBOOT_FLAGS}"
