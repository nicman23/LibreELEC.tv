# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="irssi"
PKG_VERSION="0.8.19"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.irssi.org/"
PKG_URL="https://github.com/irssi-import/irssi/releases/download/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain glib netbsd-curses openssl"
PKG_SECTION="tools"
PKG_SHORTDESC="IRC client"
PKG_LONGDESC="Irssi is a terminal based IRC client for UNIX systems"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--with-sysroot=$SYSROOT_PREFIX \
        --disable-glibtest \
        --without-socks \
        --with-textui \
        --without-bot \
        --without-proxy \
        --without-perl"

pre_configure_target() {
  export CFLAGS="$CFLAGS -I$PKG_BUILD"
  export LIBS="-ltermcap"
}

makeinstall_target() {
  : # nop
}
