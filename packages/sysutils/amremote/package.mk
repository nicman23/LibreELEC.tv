# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="amremote"
PKG_VERSION="6431040"
PKG_ARCH="arm aarch64"
PKG_LICENSE="other"
PKG_SITE="http://www.amlogic.com"
PKG_URL="https://github.com/codesnake/amremote/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain usbutils"
PKG_LONGDESC="amremote - IR remote configuration utility for Amlogic-based devices"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp remotecfg $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/lib/libreelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/libreelec

  mkdir -p $INSTALL/etc/amremote
    cp $PKG_DIR/config/*.conf $INSTALL/etc/amremote
}

post_install() {
  enable_service amlogic-remotecfg.service
}
