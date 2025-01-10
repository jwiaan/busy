#!/bin/bash -ex
mkdir -p out
cp init out
cd out
mkdir -p bin lib lib64
cp /lib64/ld-linux-x86-64.so.2 lib64
for bin in bash ls mkdir mount ps grep tree
do
	bin=`which $bin`
	cp $bin bin
	for lib in `ldd $bin | gawk '/=>/{print $3}'`
	do
		libs="$libs\n$lib"
	done
done
libs=`echo -e $libs | sort -u`
for lib in $libs
do
	cp $lib lib
done
