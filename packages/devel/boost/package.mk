# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="boost"
PKG_VERSION="1_61_0"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.boost.org/"
PKG_URL="$SOURCEFORGE_SRC/boost/boost/1.65.1/${PKG_NAME}_${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain boost:host Python2 zlib bzip2"
PKG_LONGDESC="boost: Peer-reviewed STL style libraries for C++"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

make_host() {
  cd tools/build/src/engine
    sh build.sh
}

makeinstall_host() {
  mkdir -p $TOOLCHAIN/bin
    cp bin.*/bjam $TOOLCHAIN/bin
}

pre_configure_target() {
  export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/$PKG_PYTHON_VERSION"
  export CXXFLAGS="$CXXFLAGS -I$SYSROOT_PREFIX/usr/include/$PKG_PYTHON_VERSION"
}

configure_target() {
  sh bootstrap.sh --prefix=/usr \
                  --with-bjam=$TOOLCHAIN/bin/bjam \
                  --with-python=$TOOLCHAIN/bin/python \

  echo "using gcc : `$CC -v 2>&1  | tail -n 1 |awk '{print $3}'` : $CC  : <compileflags>\"$CFLAGS\" <linkflags>\"$LDFLAGS\" ;" \
    > tools/build/src/user-config.jam
  echo "using python : ${PKG_PYTHON_VERSION/#python} : $TOOLCHAIN : $SYSROOT_PREFIX/usr/include : $SYSROOT_PREFIX/usr/lib ;" \
    >> tools/build/src/user-config.jam
}

makeinstall_target() {
  $TOOLCHAIN/bin/bjam -d2 --toolset=gcc link=static \
                                --prefix=$SYSROOT_PREFIX/usr \
                                --ignore-site-config \
                                --layout=system \
                                --with-thread \
                                --with-iostreams \
                                --with-system \
                                --with-serialization \
                                --with-filesystem \
                                --with-regex -sICU_PATH="$SYSROOT_PREFIX/usr" \
                                install
}
