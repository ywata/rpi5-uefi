#!/usr/bin/env bash

rm -rf keys
mkdir keys
# We don't really need a usable PK, so just generate a public key for it and discard the private key
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=Rockchip Platform Key/" -keyout /dev/null -outform DER -out keys/pk.cer -days 7300 -nodes -sha256
curl -L https://go.microsoft.com/fwlink/?LinkId=321185 -o keys/ms_kek.cer
curl -L https://go.microsoft.com/fwlink/?linkid=321192 -o keys/ms_db1.cer
curl -L https://go.microsoft.com/fwlink/?linkid=321194 -o keys/ms_db2.cer
curl -L https://uefi.org/sites/default/files/resources/dbxupdate_arm64.bin -o keys/arm64_dbx.bin

