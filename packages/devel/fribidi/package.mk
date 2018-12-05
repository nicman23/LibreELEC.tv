# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="fribidi"
PKG_VERSION="0.19.7"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://fribidi.freedesktop.org/"
PKG_URL="https://github.com/fribidi/fribidi/releases/download/v$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A bidirectional algorithm library."
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static \
                           --disable-debug \
                           --disable-deprecated \
                           --disable-silent-rules \
                           --enable-charsets \
                           --with-gnu-ld \
                           --without-glib"

pre_configure_target() {
  export CFLAGS="$CFLAGS -DFRIBIDI_CHUNK_SIZE=4080"
}

post_makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/bin
    cp -f $PKG_DIR/scripts/fribidi-config $SYSROOT_PREFIX/usr/bin
    chmod +x $SYSROOT_PREFIX/usr/bin/fribidi-config

  rm -rf $INSTALL/usr/bin
}
