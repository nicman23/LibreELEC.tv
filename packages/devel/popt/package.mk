# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="popt"
PKG_VERSION="1.16"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://rpm5.org/files/popt/"
PKG_URL="http://rpm5.org/files/popt/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The popt library exists essentially for parsing command-line options."

pre_configure_target() {
 cd $PKG_BUILD
 rm -rf .$TARGET_NAME
}

pre_configure_host() {
 cd $PKG_BUILD
 rm -rf .$HOST_NAME
}
