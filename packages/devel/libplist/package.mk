# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="libplist"
PKG_VERSION="1.12"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libimobiledevice.org/"
PKG_URL="http://www.libimobiledevice.org/downloads/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain glib"
PKG_LONGDESC="libplist is a library for manipulating Apple Binary and XML Property Lists"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--without-cython"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
