#!/bin/bash

# We need to install xz to be able to unzip the gcc package we're going to download in a minute
curl http://gfortran.com/download/x86_64/xz.tar.gz -o xz.tar.gz
tar xzvf xz.tar.gz 

# Get and unpack gcc-4.3 binary, including gfortran
curl http://gfortran.com/download/x86_64/snapshots/gcc-4.3.tar.xz -o gcc-4.3.tar.xz
./usr/bin/unxz gcc-4.3.tar.xz 
tar xvf gcc-4.3.tar 

# Get and unpack glibc for necessary header files
curl http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/glibc_2.7.orig.tar.gz -o glibc_2.7.orig.tar.gz
tar xzvf glibc_2.7.orig.tar.gz
tar jxvf glibc-2.7/glibc-2.7.tar.bz2

# Get and unpack R
curl http://cran.r-project.org/src/base/R-2/R-2.13.1.tar.gz -o R.tar.gz
tar xzvf R.tar.gz 
cd R-2.13.1/
# R needs to know where gfortran is and our header files from glibc
export PATH=/app/bin/gcc-4.3/bin:$PATH
export LDFLAGS="-L/app/bin/gcc-4.3/lib64/ -R/app/bin/gcc-4.3/lib64/"
export CPPFLAGS="-I/app/bin/glibc-2.7/string/ -I/app/bin/glibc-2.7/time"

# Configure, make
./configure --prefix=/app/bin/R-2.13.1/ --without-x 
make

# Link the R binary into bin/ so heroku picks it up
cd /app/bin
ln -s R-2.13-1/bin/R

# Remove all the pieces we don't need to get the size down
rm gcc-4.3.tar 
rm glibc_2.7.orig.tar.gz 
rm R.tar.gz 
rm xz.tar.gz 
rm -rf usr/
rm -rf gcc-4.3/bin
rm -rf gcc-4.3/lib
rm -rf gcc-4.3/libexec
rm -rf gcc-4.3/info
rm -rf gcc-4.3/man
rm -rf gcc-4.3/share
rm -rf gcc-4.3/include

rm glibc-2.7/*.tar.bz 
cd bin/glibc-2.7/
rm -rf abilist/ abi-tags aclocal.m4  argp assert/ b* BUGS  C* c* d* e* F* g* h* i* I* l* m* M* N* aout/ LICENSES  n* o* p* P* R* r* scripts/ setjmp/ shadow/ shlib-versions signal/ socket/ soft-fp/ stdio-common/ stdlib/ streams/ sunrpc/ sysdeps/ sysvipc/ termios/ test-skeleton.c timezone tls.make.c version.h Versions.def wcsmbs/ wctype/ WUR-REPORT 

cd ../R-2.13.1
rm -rf src
rm Make*
rm -rf doc
rm NEWS*
rm -rf test
rm config*
rm O* README ChangeLog COPYING INSTALL SVN-REVISION VERSION
NEED etc
