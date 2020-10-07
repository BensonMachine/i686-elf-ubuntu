
```sh
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential bison flex libgmp3-dev libmpc-dev \
libmpfr-dev texinfo libcloog-isl-dev libisl-dev curl

export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

mkdir /tmp/src
cd /tmp/src
curl -O https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz # If the link 404's, look for a more recent version
tar xvf binutils-2.31.1.tar.xz
mkdir binutils-build
cd binutils-build
sudo ../binutils-2.31.1/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
sudo make all install 2>&1 | tee make.log

cd /tmp/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
tar xvf gcc-8.2.0.tar.xz
mkdir gcc-build
cd gcc-build
sudo ../gcc-8.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
sudo make all-gcc 
sudo make all-target-libgcc 
sudo make install-gcc 
sudo make install-target-libgcc 


```
