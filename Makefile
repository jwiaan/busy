.PHONY: run gdb
qemu := qemu-system-x86_64 -kernel ../linux/arch/x86/boot/bzImage -nographic -append console=ttyS0
run: out.cpio
	$(qemu) -initrd $<
gdb: out.cpio
	$(qemu) -initrd $< -s -S -append nokaslr
out.cpio: $(shell find out)
	cd $< && find | cpio -oH newc > ../$@
