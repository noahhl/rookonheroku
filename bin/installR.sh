#!/bin/bash
curl http://gfortran.org/download/x86_64/xz.tar.gz -o xz.tar.gz
curl http://gfortran.org/download/x86_64/snapshots/gcc-4.3.tar.xz -o gcc-4.3.tar.xz
tar xzvf xz.tar.gz 
./usr/bin/unxz gcc-4.3.tar.xz 
tar xvf gcc-4.3.tar 
curl http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/glibc_2.7.orig.tar.gz -o glibc_2.7.orig.tar.gz
tar xzvf glibc_2.7.orig.tar.gz
tar jxvf glibc-2.7/glibc-2.7.tar.bz2
curl http://cran.r-project.org/src/base/R-2/R-2.13.1.tar.gz -o R.tar.gz
tar xzvf R.tar.gz 
cd R-2.13.1/
export PATH=/app/tmp/gcc-4.3/bin:$PATH
export LDFLAGS="-L/app/bin/gcc-4.3/lib64/ -R/app/bin/gcc-4.3/lib64/"
export CPPFLAGS="-I/app/bin/glibc-2.7/string/ -I/app/bin/glibc-2.7/time"
./configure --prefix=/app/tmp/R-2.13.1/ --without-x 
make


