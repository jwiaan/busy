.PHONY: run gdb root
q := qemu-system-x86_64 -kernel bzImage -initrd root.cpio.gz -nographic -append 'nokaslr console=ttyS0'
run:
	$(q)
gdb:
	$(q) -s -S
root:
	cd root && find | cpio -oH newc | gzip > ../root.cpio.gz
