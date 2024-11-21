#!/bin/bash
set -ex
rm -rf tmp tmp.img tmp.img.gz
dd if=/dev/zero of=tmp.img bs=1M count=10
mkfs.ext4 tmp.img
mkdir tmp
mount -oloop tmp.img tmp
mkdir tmp/bin tmp/dev
cp `which busybox` tmp/bin
cp fs/bin/init tmp/bin
umount tmp
gzip tmp.img
