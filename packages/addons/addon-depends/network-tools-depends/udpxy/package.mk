# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="udpxy"
PKG_VERSION="1.0.23-0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.udpxy.com/download-en.html"
PKG_URL="$SOURCEFORGE_SRC/project/udpxy/udpxy/Chipmunk-1.0/${PKG_NAME}.${PKG_VERSION}-prod.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A UDP-to-HTTP multicast traffic relay daemon."

makeinstall_target() {
  :
}
