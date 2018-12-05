# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="iw"
PKG_VERSION="4.3"
PKG_ARCH="any"
PKG_LICENSE="PUBLIC_DOMAIN"
PKG_SITE="http://wireless.kernel.org/en/users/Documentation/iw"
PKG_URL="https://www.kernel.org/pub/software/network/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libnl"
PKG_LONGDESC="A new nl80211 based CLI configuration utility for wireless devices."
# iw fails at runtime with lto enabled

pre_configure_target() {
  export LDFLAGS="$LDFLAGS -pthread"
}

makeinstall_target() {
  : # meh
}
