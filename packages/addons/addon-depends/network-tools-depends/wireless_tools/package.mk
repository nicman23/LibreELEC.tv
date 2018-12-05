# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="wireless_tools"
PKG_VERSION="29"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/HewlettPackard/wireless-tools"
PKG_URL="https://hewlettpackard.github.io/wireless-tools/$PKG_NAME.$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The Wireless Tools (WT) is a set of tools allowing to manipulate the Wireless Extensions."

make_target() {
  make PREFIX=/usr CC="$CC" AR="$AR" \
    CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" iwmulticall
}

makeinstall_target() {
  :
}
