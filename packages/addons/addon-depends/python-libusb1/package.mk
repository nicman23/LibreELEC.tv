# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="python-libusb1"
PKG_VERSION="1.5.3"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="https://github.com/vpelletier/python-libusb1"
PKG_URL="https://github.com/vpelletier/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host"
PKG_LONGDESC="A pure-python wrapper for libusb-1.0."
PKG_TOOLCHAIN="manual"

make_target() {
  python setup.py build
}
