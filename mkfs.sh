#!/bin/bash
set -ex
rm -rf fs fs.img fs.img.gz
dd if=/dev/zero of=fs.img bs=1M count=10
mkfs.ext4 fs.img
mkdir fs
mount -oloop fs.img fs
mkdir fs/bin fs/dev
cp `which busybox` fs/bin
cp init fs/bin
umount fs
gzip fs.img
