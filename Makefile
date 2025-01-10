.PHONY: run gdb
file := out.cpio
qemu := qemu-system-x86_64 -kernel bzImage -initrd $(file) -nographic -append console=ttyS0
run: $(file)
	$(qemu)
gdb: $(file)
	$(qemu) -s -S -append nokaslr
$(file): $(shell find out)
	cd $< && find | cpio -oH newc > ../$@
