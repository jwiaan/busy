#!/bin/bash
set -ex
file=hda
libc=../glibc/build
temp=`mktemp -d`
dd if=/dev/zero of=$file bs=1M count=100
mkfs.ext4 $file
mount $file $temp
mkdir $temp/bin $temp/lib $temp/lib64
cp /bin/busybox /bin/tree root/init $temp/bin
cp $libc/libc.so.6 $temp/lib
cp $libc/elf/ld-linux-x86-64.so.2 $temp/lib64
umount $temp
qemu-system-x86_64 -kernel ../linux/arch/x86/boot/bzImage -hda $file -append 'root=/dev/sda rw'
rm $file
