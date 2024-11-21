k := bzImage
i := fs.cpio.gz
a := 'root=/dev/ram rw console=ttyS0 nokaslr'
q := qemu-system-x86_64 -nographic -kernel $(k) -initrd $(i) -append $(a)
.PHONY: run gdb
run: $(k) $(i)
	$(q)
gdb: $(k) $(i)
	$(q) -s -S
