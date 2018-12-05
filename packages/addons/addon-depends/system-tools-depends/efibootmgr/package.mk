# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="efibootmgr"
PKG_VERSION="95f7a63" # 0.8.0
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vathpela/efibootmgr"
PKG_URL="https://github.com/vathpela/efibootmgr-devel/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain efivar pciutils zlib"
PKG_LONGDESC="Tool to modify UEFI Firmware Boot Manager Variables."

pre_make_target() {
  export EXTRA_CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include -I$SYSROOT_PREFIX/usr/include/efivar -fgnu89-inline"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -ludev -ldl"
}

makeinstall_target() {
  : # nop
}
