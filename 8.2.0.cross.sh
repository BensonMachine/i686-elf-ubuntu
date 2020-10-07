
```sh
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo libisl-dev curl

export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

mkdir $HOME/src
cd $HOME/src
curl -O https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz
tar xvf binutils-2.31.1.tar.xz
mkdir binutils-build
cd binutils-build
../binutils-2.31.1/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make all install 2>&1 | tee make.log

cd $HOME/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
tar xvf gcc-8.2.0.tar.xz
mkdir gcc-build
cd gcc-build
../gcc-8.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc 
make all-target-libgcc 
make install-gcc 
make install-target-libgcc 


```
