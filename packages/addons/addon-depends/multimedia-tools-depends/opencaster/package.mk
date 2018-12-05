# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="opencaster"
PKG_VERSION="3.2.2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.avalpa.com/the-key-values/15-free-software/33-opencaster"
PKG_URL="http://ftp.de.debian.org/debian/pool/main/o/opencaster/opencaster_${PKG_VERSION}+dfsg.orig.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A free and open source MPEG2 transport stream data generator and packet manipulator."

PKG_MAKE_OPTS_TARGET="CC=$CC"

pre_makeinstall_target() {
  mkdir -p $PKG_BUILD/.install_pkg
}
