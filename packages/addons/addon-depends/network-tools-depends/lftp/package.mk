# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="lftp"
PKG_VERSION="4.7.4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://lftp.yar.ru/"
PKG_URL="http://lftp.yar.ru/ftp/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain readline openssl zlib"
PKG_SECTION="tools"
PKG_SHORTDESC="ftp client"
PKG_LONGDESC="LFTP is a sophisticated ftp/http client, and a file transfer program supporting a number of network protocols"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-nls \
                           --without-gnutls \
                           --with-openssl \
                           --with-readline=$SYSROOT_PREFIX/usr \
                           --with-zlib=$SYSROOT_PREFIX/usr"

makeinstall_target() {
  :
}
