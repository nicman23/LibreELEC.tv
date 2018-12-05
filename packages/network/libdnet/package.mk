# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdnet"
PKG_VERSION="1.12"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/sgeto/libdnet"
PKG_URL="https://github.com/sgeto/libdnet/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A simplified, portable interface to several low-level networking routines"
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_strlcat=no \
                           ac_cv_func_strlcpy=no \
                           --enable-static \
                           --disable-shared \
                           --disable-python"

pre_configure_target() {
  sed "s|@prefix@|$SYSROOT_PREFIX/usr|g" -i $PKG_BUILD/dnet-config.in
}

post_makeinstall_target() {
  mkdir -p $TOOLCHAIN/bin
    cp dnet-config $TOOLCHAIN/bin/
}
