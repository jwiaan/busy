k := bzImage
i := fs.cpio.gz
q := kvm -kernel $(k) -initrd $(i) -nographic -append 'nokaslr console=ttyS0 root=/dev/ram rw'
.PHONY: run gdb
run: $(k) $(i)
	$(q)
gdb: $(k) $(i)
	$(q) -s -S
$(i): fs
	cd $< && find | cpio -oH newc | gzip > ../$@
