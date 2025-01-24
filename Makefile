.PHONY: run gdb
qemu := qemu-system-x86_64 -kernel ../linux/arch/x86/boot/bzImage -nographic -append console=ttyS0
run: initrd
	$(qemu) -initrd $<
gdb: initrd
	$(qemu) -initrd $< -s -S -append nokaslr
initrd: root
	cd $< && find | cpio -oH newc | gzip > ../$@
