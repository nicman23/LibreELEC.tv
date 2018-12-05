# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="bkeymaps"
PKG_VERSION="1.13"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alpinelinux.org"
PKG_URL="http://dev.alpinelinux.org/archive/bkeymaps/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain busybox"
PKG_LONGDESC="bkeymaps: binary keyboard maps for busybox"

make_target() {
  : # nothing todo, we install manually
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/keymaps
    cp -PR bkeymaps/* $INSTALL/usr/lib/keymaps
}
