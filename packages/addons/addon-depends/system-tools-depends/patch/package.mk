# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="patch"
PKG_VERSION="2.7.5"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://savannah.gnu.org/projects/patch/"
PKG_URL="http://ftpmirror.gnu.org/patch/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Patch takes a patch file containing a difference listing produced by the diff."

PKG_CONFIGURE_OPTS_TARGET="--disable-xattr"

makeinstall_target() {
  : # nop
}
