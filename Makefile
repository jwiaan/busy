qemu := qemu-system-x86_64 -kernel ~/linux/arch/x86/boot/bzImage -initrd initrd.cpio.gz -nographic -append 'nokaslr console=ttyS0'
.PHONY: run gdb initrd
run:
	$(qemu)
gdb:
	$(qemu) -s -S
initrd:
	mkdir -p initrd/bin
	cp /bin/busybox initrd/bin
	cd initrd && find | cpio -oH newc | gzip > ../initrd.cpio.gz
