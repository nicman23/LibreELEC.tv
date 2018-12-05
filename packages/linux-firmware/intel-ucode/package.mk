# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="intel-ucode"
PKG_VERSION="20170707"
PKG_ARCH="x86_64"
PKG_LICENSE="other"
PKG_SITE="https://downloadcenter.intel.com/search?keyword=linux+microcode"
PKG_URL="https://downloadmirror.intel.com/26925/eng/microcode-${PKG_VERSION}.tgz"
PKG_DEPENDS_TARGET="toolchain intel-ucode:host"
PKG_LONGDESC="intel-ucode: Intel CPU microcodes"
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p $PKG_BUILD
  tar xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tgz -C $PKG_BUILD
}

make_host() {
  :
}

makeinstall_host() {
  :
}
